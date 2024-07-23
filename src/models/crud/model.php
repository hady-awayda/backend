<?php

class selectModel {
    private static $allowedColumns = ['id', 'name', 'id', 'name', 'user_id', 'id', 'user_id', 'recipe_id', 'id', 'user_id', 'recipe_id', 'id', 'name', 'recipe_id', 'tag_id'];
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

    public static function selectWithUsername($table) {
        return "SELECT t.name, t.ingredients, t.steps, t.created_at, u.name AS username FROM $table t JOIN users u ON t.user_id = u.id;";
    }
    
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