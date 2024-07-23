### Setup

Clone this submodule and modify documentroot in apache config to point to the root of this repo, then import the recipe-app.sql file into phpmyadmin, and finally run xampp.

### API Documentation

All GET routes can accept the following optional paremeter:

- limit e.g.: api/recipes?limit=n to get n first recipes

Users:

- GET /api/users - Get all users (useful only for admin)
- GET /api/users?id - Get a single user by ID (useful for profile)

Recipes:

- GET /api/recipes - Get all recipes
- GET /api/recipes?id - Get a single recipe by ID
- GET /api/recipes?user_id - Get all recipes by user_id (useful for profile)
- GET /api/recipes?tag - Get all recipes by tag (select _ from recipes where id in (select rt.recipe_id from recipe_tags rt join tags t on rt.tag_id = t.id where t.name = $tag)) || (SELECT r._ FROM recipes r JOIN recipe_tags rt ON r.id = rt.recipe_id JOIN tags t ON rt.tag_id = t.id WHERE t.name = $tag) (useful for search)
- POST /api/recipes/createRecipe - Create new entry in the recipe table

Favorites:

- GET /api/favorites - Get all favorited recipes (useless, could be useful to show top recipes on landing page)
- GET /api/favorites?user_id - Get all favorited recipes by user ID (useful for profile)
- GET /api/favorites?recipe_id - Get all users with favorite for a specific recipe_id (useless, useful as special feature in profile)
- GET all favorited comments on a recipe ordered by the most recent or most upvotes (optional)

Tags:

- GET /api/tags - Get all tags

Authentication:

- POST /api/auth/login - Validates user credentials and returns new JWT token with user data and token expiry
- POST /api/auth/register - Registers user account and returns new JWT token with user data and token expiry

Comments:

- GET /api/comments?recipe_id - Get all comments with username by recipe ID

### Database Schema

Can be found at the following URL: https://dbdiagram.io/d/Recipe-App-669e7a908b4bb5230e04d9ea

<!-- - GET /api/comments?id - Get a single comment by ID
- GET /api/comments?user_id - Get all comments by user ID
- GET /api/comments?recipe_id&user_id - Get all comments of user ID for specific recipe ID (useless, only useful to show a user's comment first on a recipe's page)
- GET /api/comments?recipe_id&favorite - Get all comments where users have favorited the recipe (SELECT c.\* FROM comments c JOIN favorites f ON c.recipe_id = f.recipe_id JOIN users u ON c.user_id = u.id WHERE f.recipe_id = $recipe_id) -->
