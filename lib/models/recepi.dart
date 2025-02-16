class Recipe {
  final String title;
  final String ingredients;
  final String instructions;
  final String? servings; // Optional

  Recipe({
    required this.title,
    required this.ingredients,
    required this.instructions,
    this.servings, // Optional parameter
  });
}
