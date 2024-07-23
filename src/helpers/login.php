<?php
require_once 'src/helpers/loadEnv.php';
require 'vendor/autoload.php';
loadEnv('.env');

use Firebase\JWT\JWT;

class LoginHelper {
	public function generateJWT($user) {
        $secretKey = getenv('JWT_SECRET');
        $payload = [
            "iss" => "admin",
            "aud" => "users",
            "iat" => time(),
            "exp" => time() + (60 * 60 * 24 * 30),
            "id" => $user["id"],
            "email" => $user["email"],
            "role" => $user["role"],
        ];

        return JWT::encode($payload, $secretKey, 'HS256');
    }
}

// expire the token after pressing logout