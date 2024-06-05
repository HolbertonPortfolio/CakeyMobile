import 'package:cakey_portfolio/Data/ingredient.dart';

import 'recipe_step.dart';

class PastryDetail {
  final String name;
  final String description;
  final String imageUrl;
  final List<RecipeStep> recipeSteps;
  final List<Ingredient> ingredients;
  final int id;

  PastryDetail({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.recipeSteps,
    required this.ingredients,
    required this.id,
  });

  factory PastryDetail.fromJson(Map<String, dynamic> json) {
    var recipe = json['recipe'] ?? {};
    var stepsList = (recipe['steps'] as List)
        .map((step) => RecipeStep.fromJson(step))
        .toList();

    var ingredientsList = (json['ingredients'] as List)
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();

    return PastryDetail(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      recipeSteps: stepsList,
      ingredients: ingredientsList,
      id: json['id'] as int,
    );
  }
}
