import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'add_pastry_state.dart';

class AddPastryCubit extends Cubit<AddPastryState> {
  AddPastryCubit() : super(AddPastryInitial());

  final currentStep = BehaviorSubject<int>.seeded(1);

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();
  final TextEditingController _recipeNameController = TextEditingController();
  final ingredients = BehaviorSubject<List<int>>.seeded([]);
  final steps = BehaviorSubject<List<Map<String, dynamic>>>.seeded([{'description': '', 'timer': 0, 'step_number': 1}]);

  void nextStep() {
    if (_nameTextController.text.isEmpty || _descriptionTextController.text.isEmpty) {
      emit(const AddPastryValidationError("Name and Description cannot be empty"));
      return;
    }
    if (currentStep.value < 3) {
      currentStep.add(currentStep.value + 1);
      emit(AddPastryStepChanged(currentStep.value));
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.add(currentStep.value - 1);
      emit(AddPastryStepChanged(currentStep.value));
    }
  }

  void selectIngredients(List<int> ingredientIds) {
    ingredients.add(ingredientIds);
  }

  void addStep() {
    final currentSteps = List<Map<String, dynamic>>.from(steps.value);
    currentSteps.add({'description': '', 'timer': 0, 'step_number': currentSteps.length + 1});
    steps.add(currentSteps);
  }

  void removeStep(int stepNumber) {
    final currentSteps = List<Map<String, dynamic>>.from(steps.value);
    if (currentSteps.length > 1) {
      currentSteps.removeWhere((step) => step['step_number'] == stepNumber);
      for (int i = 0; i < currentSteps.length; i++) {
        currentSteps[i]['step_number'] = i + 1;
      }
      steps.add(currentSteps);
    }
  }

  TextEditingController get nameController => _nameTextController;
  TextEditingController get descriptionController => _descriptionTextController;
  TextEditingController get recipeNameController => _recipeNameController;

  @override
  Future<void> close() {
    currentStep.close();
    _nameTextController.dispose();
    _descriptionTextController.dispose();
    _recipeNameController.dispose();
    ingredients.close();
    steps.close();
    return super.close();
  }
}