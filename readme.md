### API Documentation

Optional parameters for all routes: limit=n to get n first elements

Users:

- GET /api/users - Get all users
- GET /api/users?id - Get a single user by ID

Recipes:

- GET /api/recipes - Get all recipes
- GET /api/recipes?id - Get a single recipe by ID
- GET /api/recipes?user_id - Get all recipes by user_id
- GET /api/favorites?tag - Get all recipes by tag

Comments:

- GET /api/comments - Get all comments
- GET /api/comments?id - Get a single comment by ID
- GET /api/comments?user_id - Get all comments by user ID
- GET /api/comments?recipe_id - Get all comments by recipe ID
- GET /api/comments?recipe_id&user_id - Get all comments of user ID for specific recipe ID

Favorites:

- GET /api/favorites - Get all favorites recipes
- GET /api/favorites?id - Get all favorite recipes by ID
- GET /api/favorites?user_id - Get all favorite recipes by user ID
- GET /api/favorites?recipe_id - Get all users with favorite for a specific recipe_id // useless
- GET /api/favorites?recipe_id&user_id - Get all favorite recipes by user ID (strictly unique)

Tags:

- GET /api/tags - Get all tags
- GET /api/tags?id - Get all single tag by ID
