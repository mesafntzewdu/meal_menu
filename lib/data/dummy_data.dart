import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';

class DummyData {
  static const availableCategory = [
    Category(id: 'c1', title: 'Hamburgers', color: Colors.orange),
    Category(id: 'c2', title: 'Italian', color: Colors.green),
    Category(id: 'c3', title: 'Fruits', color: Colors.purple),
    Category(id: 'c4', title: 'Meet', color: Colors.red),
    Category(id: 'c5', title: 'Quick and Easy', color: Colors.orange),
    Category(id: 'c6', title: 'Chocolates', color: Colors.brown),
    Category(id: 'c7', title: 'Biscuits', color: Color.fromARGB(221, 228, 218, 218)),
    Category(id: 'c8', title: 'Milk', color: Color.fromARGB(179, 190, 65, 65)),
    Category(id: 'c9', title: 'Alcohols', color: Colors.pink),
    Category(id: 'c10', title: 'Tunas', color: Colors.blue),
  ];

  static const dummyMeals = [
    Meal(
      id: 1,
      categories: ['c1', 'c2'],
      title: 'Spaghetti with Tomato Sauce',
      imageUrl:
          'https://www.allrecipes.com/thmb/aB951V6JkfELGWVQ1mWFrzMt6FI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/254517-spaghetti-sauce-with-fresh-tomatoes-3x2-79-609ce4edcafb4191b609180163fed92b.jpg',
      steps: [
        'From 2 patties',
        'Fry the patties for c. 4 minutes on each side',
        'Bruch buns with ketchup',
        'Serve burger with tomato, cucumber and onion'
      ],
      duration: 10,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: false,
      isLactoseFree: true,
      isVegan: true,
      isVegetarian: true,
    ),
    Meal(
      id: 1,
      categories: ['c3', 'c4'],
      title: 'Tomato Sauce',
      imageUrl:
          'https://img.freepik.com/free-photo/top-view-fast-food-mix-mozzarella-sticks-club-sandwich-hamburger-mushroom-pizza-caesar-shrimp-salad-french-fries-ketchup-mayo-cheese-sauces-table_141793-3998.jpg?w=740&t=st=1711174583~exp=1711175183~hmac=0bc00ca5ec84171b1c6f8cd3c48265ef36ac39c022f6dc543805f64adc5c9291',
      steps: [
        'From 2 patties',
        'Fry the patties for c. 4 minutes on each side',
        'Bruch buns with ketchup',
        'Serve burger with tomato, cucumber and onion'
      ],
      duration: 1,
      complexity: Complexity.simple,
      affordability: Affordability.luxurious,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegan: true,
      isVegetarian: true,
    ),
    Meal(
      id: 1,
      categories: ['c5', 'c6'],
      title: 'Spaghetti',
      imageUrl:
          'https://www.allrecipes.com/thmb/aB951V6JkfELGWVQ1mWFrzMt6FI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/254517-spaghetti-sauce-with-fresh-tomatoes-3x2-79-609ce4edcafb4191b609180163fed92b.jpg',
      steps: [
        'From 2 patties',
        'Fry the patties for c. 4 minutes on each side',
        'Bruch buns with ketchup',
        'Serve burger with tomato, cucumber and onion'
      ],
      duration: 1,
      complexity: Complexity.simple,
      affordability: Affordability.pricey,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegan: true,
      isVegetarian: true,
    ),
    Meal(
      id: 1,
      categories: ['c7', 'c8'],
      title: 'Spaghetti with Tomato Sauce',
      imageUrl:
          'https://img.freepik.com/free-photo/top-view-fast-food-mix-mozzarella-sticks-club-sandwich-hamburger-mushroom-pizza-caesar-shrimp-salad-french-fries-ketchup-mayo-cheese-sauces-table_141793-3998.jpg?w=740&t=st=1711174583~exp=1711175183~hmac=0bc00ca5ec84171b1c6f8cd3c48265ef36ac39c022f6dc543805f64adc5c9291',
      steps: [
        'From 2 patties',
        'Fry the patties for c. 4 minutes on each side',
        'Bruch buns with ketchup',
        'Serve burger with tomato, cucumber and onion'
      ],
      duration: 1,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegan: true,
      isVegetarian: true,
    ),
    Meal(
      id: 1,
      categories: ['c9', 'c10'],
      title: 'Spaghetti with Tomato Sauce',
      imageUrl:
          'https://img.freepik.com/free-photo/top-view-fast-food-mix-mozzarella-sticks-club-sandwich-hamburger-mushroom-pizza-caesar-shrimp-salad-french-fries-ketchup-mayo-cheese-sauces-table_141793-3998.jpg?w=740&t=st=1711174583~exp=1711175183~hmac=0bc00ca5ec84171b1c6f8cd3c48265ef36ac39c022f6dc543805f64adc5c9291',
      steps: [
        'From 2 patties',
        'Fry the patties for c. 4 minutes on each side',
        'Bruch buns with ketchup',
        'Serve burger with tomato, cucumber and onion'
      ],
      duration: 1,
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegan: true,
      isVegetarian: true,
    )
  ];
}
