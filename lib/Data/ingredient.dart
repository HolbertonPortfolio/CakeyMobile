class Ingredient {
  final String name;
  final String description;
  final int id;

  Ingredient({
    required this.name,
    required this.description,
    required this.id,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as int,
    );
  }
}