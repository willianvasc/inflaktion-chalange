<h1>E-mail Chalange</h1>
<p>Hi everyone! For this project, I used the <b>Plates</b> library to render the views and the <b>Router</b> to manage the routes. I hope you enjoy it!</p>
<span>To run the project, you need to execute the command <b>composer update</b>. After that, run <b>php -S localhost:8000 -t public</b>.</span>
<span>It is necessary to create a database called <b>"successful_emails"</b> and a table named <b>"successful_emails"</b> with the fields <b>id</b>, <b>email</b>, and <b>raw_text</b>.</span>
<br><br>

This API gets the body of the email and saves it in the 'email' column. It then clears the HTML body and saves the raw text in the 'raw_text' column.
## SQL
DB NAME: emails<br>
**SQL QUERY:**
```CREATE TABLE `successful_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` mediumint NOT NULL, ##the list's affiliate ID, ignore
  `envelope` text NOT NULL, ##field from the Sendgrid webook, ignore
  `from` varchar(255) NOT NULL, ##field from the Sendgrid webook, ignore
  `subject` text NOT NULL, ##field from the Sendgrid webook, ignore
  `dkim` varchar(255) DEFAULT NULL, ##field from the Sendgrid webook, ignore
  `SPF` varchar(255) DEFAULT NULL, ##field from the Sendgrid webook, ignore
  `spam_score` float DEFAULT NULL, ##field from the Sendgrid webook, ignore
  `email` longtext NOT NULL, ##the raw email payload, including headers.  parse this
  `raw_text` longtext NOT NULL, ##save the plain text content in this column
  `sender_ip` varchar(50) DEFAULT NULL, ##field from the Sendgrid webook, ignore
  `to` text NOT NULL, ##field from the Sendgrid webook, ignore
  `timestamp` int NOT NULL, ##incoming timestamp of the email, ignore
  PRIMARY KEY (`id`),
  KEY `affiliate_index` (`affiliate_id`)
);```

## API Endpoints

### POST /store
**Description:** Requires the 'email' field in the POST request, which should contain the email body in HTML. This route inserts a new email body into the database and cleans the body in the 'raw_text' column.

**Parameters:**
- email => email_html_value
- affiliate_id => affiliate_id_value
- envelope => envelope_value
- from => from_value
- subject => subject_value
- dkim => dkim_value
- SPF => SPF_value
- spam_score => spam_score_value
- sender_ip => sender_ip_value
- to => to_value

### POST /getall
**Description:** Does not require any POST values. This route lists all records in the database.

**Parameters:** None

### POST /getbyid
**Description:** Requires the 'id' field in the POST request. This route lists the record by ID.

**Parameters:**
- id => id_value

### POST /deletebyid
**Description:** Requires the 'id' field in the POST request. This route deletes the record by ID.

**Parameters:**
- id => id_value

### POST /update
**Description:** Requires the 'id' field and the 'email' field (HTML body of the email). This route updates the record by ID.

**Parameters:**
- id => id_value
- email => email_html_value
- affiliate_id => affiliate_id_value (optional)
- envelope => envelope_value (optional)
- from => from_value (optional)
- subject => subject_value (optional)
- dkim => dkim_value (optional)
- SPF => SPF_value (optional)
- spam_score => spam_score_value (optional)
- sender_ip => sender_ip_value (optional)
- to => to_value (optional)

**Note:** To send a POST request, you need to include the token in your request body:

**Token:**
- token => "7c4a8d09ca3762af61e59520943dc26494f8941b"
