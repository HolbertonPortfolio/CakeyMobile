import 'package:cakey_portfolio/Data/ingredient.dart';

class PastryDetail {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> recipeSteps;
  final List<int> timers;
  final List<Ingredient> ingredients;
  final int id;

  PastryDetail({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.recipeSteps,
    required this.timers,
    required this.ingredients,
    required this.id,
  });

  factory PastryDetail.fromJson(Map<String, dynamic> json) {
    var recipe = json['recipe'] ?? {};
    var ingredientsList = (json['ingredients'] as List)
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();

    return PastryDetail(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      recipeSteps: List<String>.from(recipe['steps']),
      timers: List<int>.from(recipe['timers']),
      ingredients: ingredientsList,
      id: json['id'] as int,
    );
  }
}