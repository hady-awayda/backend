<?php
require "src/helpers/connection.php";

$db = dbConnect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$recipe_id = isset($_GET['recipe_id']) ? intval($_GET['recipe_id']) : 0;
	
	$input = json_decode(file_get_contents('php://input'), true);
	
	$title = $input['title'] ?? '';
	$description = $input['description'] ?? '';
	$rating = $input['rating'] ?? 0;
	$user_id = $input['user_id'] ?? 0;
	$created_at = $input['created_at'] ?? date('Y-m-d H:i:s');
	$updated_at = $input['updated_at'] ?? date('Y-m-d H:i:s');
	
	if ($title === '' || $description === '' || $rating <= 0 || $user_id <= 0 || $recipe_id <= 0) {
		http_response_code(400);
		echo json_encode(['message' => 'Invalid input data']);
		return;
	}

	$sql = "INSERT INTO comments (title, description, rating, created_at, updated_at, user_id, recipe_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
	$stmt = $db->prepare($sql);

	$stmt->bind_param('ssissii', $title, $description, $rating, $created_at, $updated_at, $user_id, $recipe_id);
	if ($stmt->execute()) {
		http_response_code(201);
		echo json_encode(['message' => 'Comment added successfully']);
	} else {
		http_response_code(500);
		echo json_encode(['message' => 'Failed to add comment']);
	}

	$stmt->close();
} else {
	http_response_code(405);
	echo json_encode(['message' => 'Method not allowed']);
}
?>
