enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final int id;

  final List<String> categories;

  final String title;

  final String imageUrl;

  final int duration;

  final List<String> steps;

  final Affordability affordability;

  final Complexity complexity;

  final bool isLactoseFree;

  final bool isGlutenFree;

  final bool isVegan;

  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
