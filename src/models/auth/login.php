<?php
require_once 'src/helpers/connection.php';

class LoginModel {
    private $db;

    public function __construct() {
        $this->db = dbConnect();
    }

    public function getUserByEmail($email) {
        $stmt = $this->db->prepare("SELECT id, name, password, email, role FROM users WHERE email = ?");
        
        // Bind the username parameter
        $stmt->bind_param("s", $email);

        // Execute the statement
        $stmt->execute();

        // Get the result
        $result = $stmt->get_result();

        // Fetch the user data
        $user = $result->fetch_assoc();
        
        // Close the statement
        $stmt->close();

        return $user;
    }

    public function __destruct() {
        $this->db->close();
    }
}