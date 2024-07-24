<?php

require "src/helpers/connection.php";

$db = dbConnect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $user_id = $input['user_id'] ?? 0;
    $recipe_id = $input['recipe_id'] ?? 0;

    if ($user_id <= 0 || $recipe_id <= 0) {
        http_response_code(400);
        echo json_encode(['message' => 'Invalid user ID or recipe ID']);
        return;
    }

    $checkSql = "SELECT * FROM favorites WHERE user_id = ? AND recipe_id = ?";
    $checkStmt = $db->prepare($checkSql);
    $checkStmt->bind_param('ii', $user_id, $recipe_id);
    $checkStmt->execute();
    $result = $checkStmt->get_result();

    if ($result->num_rows > 0) {
        http_response_code(409);
        echo json_encode(['message' => 'Favorite already exists']);
        return;
    }

    $sql = "INSERT INTO favorites (user_id, recipe_id, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)";
    $stmt = $db->prepare($sql);
    $stmt->bind_param('ii', $user_id, $recipe_id);

    if ($stmt->execute()) {
        http_response_code(201);
        echo json_encode(['message' => 'Favorite added successfully']);
    } else {
        http_response_code(500);
        echo json_encode(['message' => 'Failed to add favorite']);
    }

    $stmt->close();
} else {
    http_response_code(405);
    echo json_encode(['message' => 'Method not allowed']);
}

$db->close();

?>
