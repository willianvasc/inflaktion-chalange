<?php

namespace app\controllers;

use app\controllers\Controller;

class emailController
{
    private $db;

    public function __construct()
    {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "emails";

        try {
            // Create the PDO connection
            $dsn = "mysql:host=$servername;dbname=$dbname";
            $this->db = new \PDO($dsn, $username, $password);

            // Set PDO error mode to exceptions
            $this->db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            // Handle connection errors
            $this->sendJsonResponse(['error' => "Connection failed: " . $e->getMessage()], 500);
        }
    }

    public function getAll($params)
    {
        $page = isset($params->page) ? (int)$params->page : 1;
        $pageSize = isset($params->pageSize) ? (int)$params->pageSize : 10;
        $offset = ($page - 1) * $pageSize;
        $order = isset($params->order) && strtoupper($params->order) === 'DESC' ? 'DESC' : 'ASC';

        try {
            $stmt = $this->db->prepare("SELECT * FROM successful_emails ORDER BY id $order LIMIT :offset, :pageSize");
            $stmt->bindParam(':offset', $offset, \PDO::PARAM_INT);
            $stmt->bindParam(':pageSize', $pageSize, \PDO::PARAM_INT);
            $stmt->execute();

            // Get all records in db
            $emails = $stmt->fetchAll(\PDO::FETCH_ASSOC);

            // Return all emails in JSON format
            $this->sendJsonResponse($emails);
        } catch (\PDOException $e) {
            $this->sendJsonResponse(['error' => "Error in getAll method: " . $e->getMessage()], 500);
        }
    }

    public function getById($params)
    {
        try {
            $stmt = $this->db->prepare("SELECT * FROM successful_emails WHERE id = :id");
            $stmt->bindParam(":id", $params->id, \PDO::PARAM_INT);
            $stmt->execute();

            $email = $stmt->fetch(\PDO::FETCH_ASSOC);

            if ($email) {
                $this->sendJsonResponse($email);
            } else {
                $this->sendJsonResponse(['error' => 'Email not found'], 404);
            }
        } catch (\PDOException $e) {
            $this->sendJsonResponse(['error' => "Error in getById method: " . $e->getMessage()], 500);
        }
    }

    public function deleteById($params)
    {
        try {
            $stmt = $this->db->prepare("DELETE FROM successful_emails WHERE id = :id");
            $stmt->bindParam(":id", $params->id, \PDO::PARAM_INT);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                $this->sendJsonResponse(['message' => 'Email successfully deleted']);
            } else {
                $this->sendJsonResponse(['error' => 'Email not found'], 404);
            }
        } catch (\PDOException $e) {
            $this->sendJsonResponse(['error' => "Error in deleteById method: " . $e->getMessage()], 500);
        }
    }

    public function update($params)
    {
        $updateFields = [];
        if (isset($params->email)) {
            $raw_text = $this->extractHtmlBody($params->email);
            $raw_text = $this->cleanText($raw_text);
            $updateFields['email'] = $params->email;
            $updateFields['raw_text'] = $raw_text;
        }
        if (isset($params->affiliate_id)) {
            $updateFields['affiliate_id'] = $params->affiliate_id;
        }
        if (isset($params->envelope)) {
            $updateFields['envelope'] = $params->envelope;
        }
        if (isset($params->from)) {
            $updateFields['from'] = $params->from;
        }
        if (isset($params->subject)) {
            $updateFields['subject'] = $params->subject;
        }
        if (isset($params->dkim)) {
            $updateFields['dkim'] = $params->dkim;
        }
        if (isset($params->SPF)) {
            $updateFields['SPF'] = $params->SPF;
        }
        if (isset($params->spam_score)) {
            $updateFields['spam_score'] = $params->spam_score;
        }
        if (isset($params->sender_ip)) {
            $updateFields['sender_ip'] = $params->sender_ip;
        }
        if (isset($params->to)) {
            $updateFields['to'] = $params->to;
        }

        if (empty($updateFields)) {
            $this->sendJsonResponse(['error' => 'No fields to update'], 400);
            return;
        }

        $updateClauses = [];
        foreach ($updateFields as $field => $value) {
            $updateClauses[] = "$field = :$field";
        }

        try {
            $sql = "UPDATE successful_emails SET " . implode(', ', $updateClauses) . " WHERE id = :id";
            $stmt = $this->db->prepare($sql);
            foreach ($updateFields as $field => &$value) {
                $stmt->bindParam(":$field", $value);
            }
            $stmt->bindParam(":id", $params->id, \PDO::PARAM_INT);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                $this->sendJsonResponse(['message' => 'Email successfully updated']);
            } else {
                $this->sendJsonResponse(['error' => 'Email not updated'], 404);
            }
        } catch (\PDOException $e) {
            $this->sendJsonResponse(['error' => "Error in update method: " . $e->getMessage()], 500);
        }
    }
    public function store($params)
    {
        // List of required fields
        $requiredFields = [
            'affiliate_id', 'envelope', 'from', 'subject', 'dkim', 'SPF', 'spam_score', 'email', 'sender_ip', 'to'
        ];

        // Check for missing fields
        $missingFields = [];
        foreach ($requiredFields as $field) {
            if (!isset($params->$field)) {
                $missingFields[] = $field;
            }
        }

        if (!empty($missingFields)) {
            $this->sendJsonResponse(['error' => 'Missing fields: ' . implode(', ', $missingFields)], 400);
            return;
        }

        // Process and clean the email content
        $raw_text = $this->extractHtmlBody($params->email);
        $raw_text = $this->cleanText($raw_text);

        try {
            $stmt = $this->db->prepare("INSERT INTO successful_emails (`affiliate_id`,`envelope`,`from`,`subject`,`dkim`,`SPF`,`spam_score`,`email`,`raw_text`,`sender_ip`,`to`) VALUES (:affiliate_id,:envelope,:from_email,:subject_email,:dkim,:SPF,:spam_score,:email,:raw_text,:sender_ip,:to_email)");
            $stmt->bindParam(":affiliate_id", $params->affiliate_id);
            $stmt->bindParam(":envelope", $params->envelope);
            $stmt->bindParam(":from_email", $params->from);
            $stmt->bindParam(":subject_email", $params->subject);
            $stmt->bindParam(":dkim", $params->dkim);
            $stmt->bindParam(":SPF", $params->SPF);
            $stmt->bindParam(":spam_score", $params->spam_score);
            $stmt->bindParam(":email", $params->email);
            $stmt->bindParam(":raw_text", $raw_text);
            $stmt->bindParam(":sender_ip", $params->sender_ip);
            $stmt->bindParam(":to_email", $params->to);
            $stmt->execute();

            $this->sendJsonResponse(['message' => 'Email successfully created']);
        } catch (\PDOException $e) {
            $this->sendJsonResponse(['error' => "Error in store method: " . $e->getMessage()], 500);
        }
    }

    private function cleanText($text)
    {
        // Remove HTML tags
        $text = strip_tags($text);

        // Replace escaped characters with actual line breaks
        $text = str_replace("\\r\\n", "\n", $text);
        $text = str_replace("\\\"", "\"", $text);

        // Remove leading and trailing whitespace from each line
        $text = preg_replace('/^\s+/m', '', $text);

        // Remove extra blank lines
        $text = preg_replace('/\n\s*\n/', "\n\n", $text);

        // Remove additional backslashes
        $text = str_replace("\\", "", $text);

        return $text;
    }
    private function extractHtmlBody($text)
    {
        // Use regex to find content between <body> and </body> tags
        if (preg_match('/<body[^>]*>(.*?)<\/body>/is', $text, $matches)) {
            return trim($matches[1]);
        }
        return $text; // Return original text if no <body> tags are found
    }
    private function sendJsonResponse($data, $statusCode = 200)
    {
        header('Content-Type: application/json');
        http_response_code($statusCode);
        echo json_encode($data);
        exit();
    }
}
