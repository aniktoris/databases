SELECT recipes.recipe_name, categories.category_name, steps.step_description
FROM Recipes
JOIN RecipeCategory ON Recipes.id = RecipeCategory.recipe_id
JOIN Categories ON RecipeCategory.category_id = Categories.id
JOIN RecipeIngredients ON Recipes.id = RecipeIngredients.recipe_id
JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.id
JOIN RecipeSteps ON Recipes.id = RecipeSteps.recipe_id
JOIN Steps ON RecipeSteps.step_id = Steps.id
WHERE categories.category_name = 'Vegetarian' AND Ingredients.ingredient_name LIKE '%cheese'; 

SELECT recipes.recipe_name, categories.category_name
FROM recipes
JOIN RecipeCategory ON Recipes.id = RecipeCategory.recipe_id
JOIN Categories ON RecipeCategory.category_id = Categories.id
WHERE categories.category_name IN ('No-Bake', 'Cake');

SELECT recipes.recipe_name, categories.category_name
FROM recipes
JOIN RecipeCategory ON Recipes.id = RecipeCategory.recipe_id
JOIN Categories ON RecipeCategory.category_id = Categories.id
WHERE categories.category_name = 'Vegan' OR categories.category_name = 'Japanese';