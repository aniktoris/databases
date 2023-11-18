CREATE TABLE Recipes (
  recipe_id INT AUTO_INCREMENT PRIMARY KEY,
  recipe_name VARCHAR(22)
);

INSERT INTO Recipes (recipe_name) VALUES 
  ('No-Bake Cheesecake'),
    ('Roasted Brussels Sprouts'),
      ('Mac & Cheese'),
        ('Tamagoyaki Japanese Omelette');

CREATE TABLE Categories(
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50)
);

INSERT INTO Categories (category_name) VALUES 
  ('Cake'), ('No-Bake'), ('Vegetarian'),
  ('Vegan'), ('Gluten-Free'), ('Japanese');

CREATE TABLE Ingredients (
  ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
  ingredient_name VARCHAR(28)
);

INSERT INTO Ingredients (ingredient_name) VALUES
('Condensed milk'), ('Cream Cheese'), ('Lemon Juice'), ('Pie Crust'), ('Cherry Jam'), 
('Brussels Sprouts'), ('Sesame seeds'), ('Pepper'), ('Salt'), ('Olive oil'),
('Macaroni'), ('Butter'), ('Flour'), ('Milk'), ('Shredded Cheddar cheese'),
('Eggs'), ('Soy sauce'), ('Sugar');

CREATE TABLE RecipeCategory(
  recipe_id INT,
  category_id INT,
  PRIMARY KEY (recipe_id, category_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO RecipeCategory (recipe_id, category_id) VALUES 
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (3, 3),
  (4, 3),
  (4, 6);

CREATE TABLE Steps (
  step_id INT AUTO_INCREMENT PRIMARY KEY, 
  step_description TEXT
);

INSERT INTO Steps (step_description) VALUES
('Beat Cream Cheese'),
('Add condensed Milk and blend'),
('Add Lemon Juice and blend'),
('Add the mix to the pie crust'),
('Spread the Cherry Jam'),
('Place in refrigerator for 3h'),

('Preheat the oven'),
('Mix the ingredients in a bowl'),
('Spread the mix on baking sheet'),
('Bake for 30'),

('Cook Macaroni for 8'),
('Melt butter in a saucepan'),
('Add flour, salt, pepper and mix'),
('Add Milk and mix'),
('Cook until mix is smooth'),
('Add cheddar cheese'),
('Add the macaroni'),

('Beat the eggs'),
('Add soya sauce, sugar and salt'),
('Add oil to a sauce pan'),
('Bring to medium heat'),
('Add some mix to the sauce pan'),
('Let is cook for 1'),
('Remove pan from fire');

CREATE TABLE RecipeSteps (
  recipe_id INT, 
  step_id INT,
  step_order INT,
  PRIMARY KEY (recipe_id, step_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
  FOREIGN KEY (step_id) REFERENCES Steps(step_id)
);

INSERT INTO RecipeSteps (recipe_id, step_id, step_order) VALUES
  (1, 1, 1),
  (1, 2, 2),
  (1, 3, 3),
  (1, 4, 4),
  (1, 5, 5),
  (1, 6, 6),

  (2, 7, 1),
  (2, 8, 2),
  (2, 9, 3),
  (2, 10, 4),
  
  (3, 11, 1),
  (3, 12, 2),
  (3, 13, 3),
  (3, 14, 4),
  (3, 15, 5),
  (3, 16, 6),
  (3, 17, 7)

  (4, 18, 1),
  (4, 19, 2),
  (4, 20, 3),
  (4, 21, 4),
  (4, 22, 5),
  (4, 23, 6),
  (4, 20, 7),
  (4, 22, 8),
  (4, 23, 9),
  (4, 24, 10);

CREATE TABLE RecipeIngredients (
  recipe_id INT,
  ingredient_id INT,
  PRIMARY KEY (recipe_id, ingredient_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

INSERT INTO RecipeIngredients (recipe_id, ingredient_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),

  (2, 6),
  (2, 3),
  (2, 7),
  (2, 8),
  (2, 9),
  (2, 10),
  
  (3, 11),
  (3, 12),
  (3, 13),
  (3, 8),
  (3, 9),
  (3, 14),
  (3, 15),

  (4, 16),
  (4, 17),
  (4, 18),
  (4, 9),
  (4, 10);