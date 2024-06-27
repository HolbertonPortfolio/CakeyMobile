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

  void nextStep() {
    if (_nameTextController.text.isEmpty || _descriptionTextController.text.isEmpty) {
      emit(AddPastryValidationError("Name and Description cannot be empty"));
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

  TextEditingController get nameController => _nameTextController;
  TextEditingController get descriptionController => _descriptionTextController;

  @override
  Future<void> close() {
    currentStep.close();
    _nameTextController.dispose();
    _descriptionTextController.dispose();
    return super.close();
  }
}