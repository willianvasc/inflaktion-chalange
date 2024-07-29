<?php

namespace app\controllers;

use app\controllers\Controller;

class emailController
{
    private $db;

    public function __construct()
    {
        $servername = "127.0.0.1";
        $username = "root";
        $password = "";
        $dbname = "successful_emails";

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
        try {
            $stmt = $this->db->query("SELECT * FROM successful_emails");

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
        $raw_text = $this->cleanText($params->email);

        try {
            $stmt = $this->db->prepare("UPDATE successful_emails SET email = :email, raw_text = :raw_text WHERE id = :id");
            $stmt->bindParam(":email", $params->email);
            $stmt->bindParam(":raw_text", $raw_text);
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
        $raw_text = $this->cleanText($params->email);

        try {
            $stmt = $this->db->prepare("INSERT INTO successful_emails (email, raw_text) VALUES (:email, :raw_text)");
            $stmt->bindParam(":email", $params->email);
            $stmt->bindParam(":raw_text", $raw_text);
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

    private function sendJsonResponse($data, $statusCode = 200)
    {
        header('Content-Type: application/json');
        http_response_code($statusCode);
        echo json_encode($data);
        exit();
    }
}
