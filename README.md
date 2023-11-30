# DATABASES
## Food recipes database using MySQL

A database for storing food recipes: No-Bake Cheesecake, Roasted Brussels Sprouts, Mac & Cheese and Tamagoyaki Japanese Omelette.

## Analysis on 2NF(Second Normal Form) or 3NF(Third Normal Form)

1. Recipes table: no partial dependency on PK, the attribute recipe_name is fully dependent on PK. No issues with atomicity or primary key uniqueness.
1. Categories table: similar to Recipes table, in a normalized form.
1. RecipeCategory table: a junction table between Recipes and Categories tables. The composite PK is a combination of both attributes in the table, ensuring uniqueness. Resolves the many-to-many relationship to a separate table, avoiding redundancy and ensuring relational integrity.
1. Ingredients table: 2 attributes, in a normalized form.
1. RecipeIngredients table: a junction table between Recipes and Ingredients tables. Similar to RecipeCategory the composite PK ensures uniqueness. Resolves the many-to-many relationship to a separate table.
1. Steps table: in a normalized form.
1. RecipeSteps table: a junction table between Recipes and Steps. It has a composite PK but also includes step_order attribute. 

### Conclusion: 
The database is normalized up to the 3NF because there is no violation of a transitive dependency (the columns do not depend on the columns which is not a PK). The tables avoid redundancy and maintain proper relationships through primary and foreign keys, supporting data integrity. 

### Decision about embedding:
Fields like recipe name, categories, ingredients, steps are directly related to a recipe, that's why were embedded within the recipe document at MongoDB. Each recipe document now contains its name, associated categories, ingredients, and steps. This approach improves query performance since all related information for a recipe is retrieved in a single query. The size of documents is relatively small and probably won't be changed much over time, so it make sense to embed. MongoDB is a preferable choice of mine for this recipes database.