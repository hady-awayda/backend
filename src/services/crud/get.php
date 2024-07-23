<?php
require 'src/models/crud/model.php';

class selectService {
	// split this into query stuff into model and sanitize and validate inputs in the service here and return the results in json or error here
	public static function select($conn, $table, $param, $value, $limit = null) {
		if (!selectModel::isValidColumn($param)) {
            die("Invalid column name");
        }

		if ($table === "recipes") {
			$query = selectModel::selectRecipe($param);
		} elseif ($table === "comments") {
			$query = selectModel::selectAllComments();
		} else {
			$query = selectModel::select($table, $param);
		}

		$stmt = $conn->prepare($query);
		
		$stmt -> bind_param('i', $value);

		$stmt->execute();
		$result = $stmt->get_result();

		if ($result->num_rows > 0) {
			$rows = [];
			while (($limit === null || $limit > 0) && $row = $result->fetch_assoc()) {
				$rows[] = $row;
				$limit--;
			}
			echo json_encode(["data" => $rows]);
		} else {
			http_response_code(404);
			echo json_encode(["message" => "Item not found"]);
		}
	}

	public static function selectAll($conn, $table, $limit = null) {
		if ($table === "recipes") {
			$query = selectModel::selectAllRecipes();
		} else {
			$query = selectModel::selectAll($table);
		}
		
		$stmt = $conn->prepare($query);
		$stmt->execute();
		$result = $stmt->get_result();
	
		if ($result->num_rows > 0) {
			$rows = [];
			while (($limit === null || $limit > 0) && $row = $result->fetch_assoc()) {
				$rows[] = $row;
				$limit--;
			}
			echo json_encode(["data" => $rows]);
		} else {
			http_response_code(404);
			echo json_encode(["message" => "Items not found"]);
		}
	}
}