const { MongoClient, ServerApiVersion } = require('mongodb');
require('dotenv').config();

async function createManyRecipes(client, recipes) {
  const result = await client
    .db('recipes')
    .collection('recipes')
    .insertMany(recipes);

  console.log(`Created new recipes ${result.insertedCount}`);
}

async function main() {
  if (process.env.MONGODB_URL == null) {
    throw Error(`You did not set up the environment variables correctly.`);
  }
  const client = new MongoClient(process.env.MONGODB_URL, {
    serverApi: ServerApiVersion.v1,
  });

  try {
    await client.connect();

    await createManyRecipes(client, [
      {
        name: 'No-Bake Cheesecake',
        categories: ['Cake', 'No-Bake', 'Vegetarian'],
        ingredients: [
          'Condensed milk',
          'Cream Cheese',
          'Lemon Juice',
          'Pie Crust',
          'Cherry Jam',
        ],
        steps: [
          'Beat Cream Cheese',
          'Add condensed Milk and blend',
          'Add Lemon Juice and blend',
          'Add the mix to the pie crust',
          'Spread the Cherry Jam',
          'Place in refrigerator for 3h',
        ],
      },
      {
        name: 'Roasted Brussels Sprouts',
        categories: ['Vegan', 'Gluten-Free'],
        ingredients: [
          'Brussels Sprouts',
          'Lemon juice',
          'Sesame seeds',
          'Pepper',
          'Salt',
          'Olive oil',
        ],
        steps: [
          'Preheat the oven',
          'Mix the ingredients in a bowl',
          'Spread the mix on baking sheet',
          'Bake for 30',
        ],
      },
      {
        name: 'Mac & Cheese',
        categories: ['Vegetarian'],
        ingredients: [
          'Macaroni',
          'Butter',
          'Flour',
          'Salt',
          'Pepper',
          'Milk',
          'Shredded Cheddar cheese',
        ],
        steps: [
          'Cook Macaroni for 8',
          'Melt butter in a saucepan',
          'Add flour, salt, pepper and mix',
          'Add Milk and mix',
          'Cook until mix is smooth',
          'Add cheddar cheese',
          'Add the macaroni',
        ],
      },
      {
        name: 'Tamagoyaki Japanese Omelette',
        categories: ['Vegetarian', 'Japanese'],
        ingredients: ['Eggs', 'Soy sauce', 'Sugar', 'Salt', 'Olive Oil'],
        steps: [
          'Beat the eggs',
          'Add soya sauce, sugar, and salt',
          'Add oil to a saucepan',
          'Bring to medium heat',
          'Add some mix to the saucepan',
          'Let it cook for 1 minute',
          'Remove pan from fire',
        ],
      },
    ]);
  } catch (err) {
    console.error(err);
  } finally {
    client.close();
  }
}

main();
