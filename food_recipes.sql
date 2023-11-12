CREATE TABLE recipes (
  recipe_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(22),
  category VARCHAR(22)
);

INSERT INTO recipes (name, category) VALUES 
  ('Sushi Roll', 'Japanese'),
    ('Chocolate Cake', 'Cake'),
      ('Vegetable Stir-Fry', 'Vegetarian'),
        ('Vegetable Noodles', 'Vegetarian');

CREATE TABLE ingredients (
  ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
  ingredient_name VARCHAR(22)
);

INSERT INTO ingredients (ingredient_name) VALUES
('Rice'), ('Nori'), ('Fish'), ('Vegetables'), ('Chocolate'), ('Flour'), ('Sugar'),
('Eggs'), ('Butter'), ('Spices'), ('Noodles');

CREATE TABLE steps (
  step_id INT AUTO_INCREMENT PRIMARY KEY, 
  step_description VARCHAR(22)
);

INSERT INTO steps (step_description) VALUES
('Cook rice/noodles according to package instructions.'),
('Roll sushi using nori and prepared ingredients.'),
('Preheat the oven to 350°F.'),
('Mix chocolate and flour, then bake for 30 mins.'),
('Stir-fry vegetables in a pan.');

CREATE TABLE recipeSteps (
  recipe_id INT, 
  step_id INT,
  step_order INT,
  PRIMARY KEY (recipe_id, step_id),
  FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
  FOREIGN KEY (step_id) REFERENCES steps(step_id)
);

INSERT INTO recipeSteps (recipe_id, step_id, step_order) VALUES
  (1, 1, 1),
  (1, 2, 2),
  (2, 3, 1),
  (2, 4, 2),
  (3, 5, 1),
  (4, 1, 1),
  (4, 5, 2);

CREATE TABLE recipeIngredients (
  recipe_id INT,
  ingredient_id INT,
  PRIMARY KEY (recipe_id, ingredient_id),
  FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

INSERT INTO recipeIngredients (recipe_id, ingredient_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 8),
  (3, 4),
  (3, 10),
  (4, 4),
  (4, 11);