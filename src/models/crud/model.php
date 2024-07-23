<?php

class selectModel {
    private static $allowedColumns = ['id', 'name', 'user_id', 'recipe_id', 'name', 'tag_id'];
    private static $allowedTables = ['users', 'recipes', 'comments', 'favorites', 'tags', 'recipe_tags'];

    public static function isValidColumn($column) {
        return in_array($column, self::$allowedColumns);
    }

    public static function isValidTable($table) {
        return in_array($table, self::$allowedTables);
    }

    public static function selectAll($table) {
        return "SELECT * FROM $table;";
    }

    public static function select($table, $param) {
		if ($param == 'id') {
		    return "SELECT * FROM $table WHERE id = ?;";
		}
        
		return "SELECT * FROM $table WHERE $param = ?;";
	}

    public static function selectAllRecipes() {
        return "SELECT t.id, t.name, t.ingredients, t.steps, t.created_at as createdDate, u.name AS username FROM recipes t JOIN users u ON t.user_id = u.id;";
    }

    public static function selectRecipe($param) {
        return "SELECT t.id, t.name, t.ingredients, t.steps, t.created_at as createdDate, u.name AS username FROM recipes t JOIN users u ON t.user_id = u.id WHERE t.$param = ?;";
    }

    public static function selectAllComments() {
        return "SELECT c.id, c.title, c.description, c.rating, c.created_at AS createdDate, u.name AS username FROM comments c JOIN users u ON c.user_id = u.id WHERE c.recipe_id = ?;";
    }

    // public static function selectComment($param) {
    //     return "SELECT t.id, t.name, t.ingredients, t.steps, t.created_at as createdDate, u.name AS username FROM comments t JOIN users u ON t.user_id = u.id WHERE t.$param = ?;";
    // }

    
    public static function insert($table, $data) {
        if (!is_array($data)) {
            throw new InvalidArgumentException("Data must be an array.");
        }
        
        $columns = implode(", ", array_keys($data));
        $placeholders = implode(", ", array_fill(0, count($data), "?"));

        return "INSERT INTO $table ($columns) VALUES ($placeholders)";
    }

    public static function delete($table, $param) {
        return "DELETE FROM $table WHERE $param = ?;";
    }
    
    /////////////////////
 
    
}