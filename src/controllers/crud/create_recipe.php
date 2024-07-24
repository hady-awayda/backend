<?php
require "src/helpers/connection.php";

$db = dbConnect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$input = json_decode(file_get_contents('php://input'), true);
	
	$name = $input['name'] ?? '';
	$ingredients = $input['ingredients'] ?? '';
	$steps = $input['steps'] ?? 0;
	$created_at = $input['created_at'] ?? date('Y-m-d H:i:s');
	$updated_at = $input['updated_at'] ?? date('Y-m-d H:i:s');
	$user_id = $input['user_id'] ?? 0;
	
	if ($name === '' || $ingredients === '' || $steps === '' || $user_id <= 0) {
		http_response_code(400);
		echo json_encode(['message' => 'Invalid input data']);
		return;
	}
	
	$sql = "INSERT INTO recipes (name, ingredients, steps, created_at, updated_at, user_id) VALUES (?, ?, ?, ?, ?, ?)";
	$stmt = $db->prepare($sql);
	
	echo "Hello World";
	$stmt->bind_param('ssssss', $name, $ingredients, $steps, $created_at, $updated_at, $user_id);
	if ($stmt->execute()) {
		http_response_code(201);
		echo json_encode(['message' => 'Recipe added successfully']);
	} else {
		http_response_code(500);
		echo json_encode(['message' => 'Failed to add recipe']);
	}

	$stmt->close();
} else {
	http_response_code(405);
	echo json_encode(['message' => 'Method not allowed']);
}
?>
