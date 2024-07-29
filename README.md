
<p>Hi everyone! For this project, I used the <b>Plates</b> library to render the views and the <b>Router</b> to manage the routes. I hope you enjoy it!</p>
<span>To run the project, you need to execute the command <b>composer update</b>. After that, run <b>php -S localhost:8000 -t public</b>.</span>
<span>It is necessary to create a database called <b>"successful_emails"</b> and a table named <b>"successful_emails"</b> with the fields <b>id</b>, <b>email</b>, and <b>raw_text</b>.</span>
<br><br>

This API gets the body of the email and saves it in the 'email' column. It then clears the HTML body and saves the raw text in the 'raw_text' column.

Routes:

- **POST /store**: Requires the 'email' field in the POST request, which should contain the email body in HTML. This route inserts a new email body into the database and cleans the body in the 'raw_text' column.
- **POST /getall**: Does not require any POST values. This route lists all records in the database.
- **POST /getbyid**: Requires the 'id' field in the POST request. This route lists the record by ID.
- **POST /deletebyid**: Requires the 'id' field in the POST request. This route deletes the record by ID.
- **POST /update**: Requires the 'id' field and the 'email' field (HTML body of the email). This route updates the record by ID.

POST:
- **/store** | email => email_html_value
- **/getall** | no params
- **/getbyid** | id => id_value
- **/deletebyid** | id => id_value
- **/update** | id => id_value, email => email_html_value

To send a POST request, you need to include the token in your request body:

token => "7c4a8d09ca3762af61e59520943dc26494f8941b"
