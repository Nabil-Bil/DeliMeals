enum Complexity {
  // ignore: constant_identifier_names
  Simple,
  // ignore: constant_identifier_names
  Challenging,
  // ignore: constant_identifier_names
  Hard,
}

enum Affordability {
  // ignore: constant_identifier_names
  Affordable,
  // ignore: constant_identifier_names
  Pricey,
  // ignore: constant_identifier_names
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  bool isFavorite;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    this.isFavorite = false,
  });
}
