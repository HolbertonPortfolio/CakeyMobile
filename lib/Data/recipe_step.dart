class RecipeStep {
  final String description;
  final int timer;
  final int stepNumber;
  final int id;

  RecipeStep({
    required this.description,
    required this.timer,
    required this.stepNumber,
    required this.id,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      description: json['description'] as String,
      timer: json['timer'] as int,
      stepNumber: json['step_number'] as int,
      id: json['id'] as int,
    );
  }
}
