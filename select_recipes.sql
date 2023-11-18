SELECT recipes.recipe_name, categories.category_name
FROM Recipes
JOIN RecipeCategory ON Recipes.recipe_id = RecipeCategory.recipe_id
JOIN Categories ON RecipeCategory.category_id = Categories.category_id
JOIN RecipeIngredients ON Recipes.recipe_id = RecipeIngredients.recipe_id
JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.ingredient_id
WHERE categories.category_name = 'Vegetarian' AND Ingredients.ingredient_name LIKE '%cheese'; 

SELECT recipes.recipe_name, categories.category_name
FROM recipes
JOIN RecipeCategory ON recipes.recipe_id = RecipeCategory.recipe_id
JOIN Categories ON RecipeCategory.category_id = Categories.category_id
WHERE categories.category_name IN ('No-Bake', 'Cake');

SELECT recipes.recipe_name, categories.category_name
FROM recipes
JOIN RecipeCategory ON recipes.recipe_id = RecipeCategory.recipe_id
JOIN Categories ON RecipeCategory.category_id = Categories.category_id
WHERE categories.category_name = 'Vegan' OR categories.category_name = 'Japanese';