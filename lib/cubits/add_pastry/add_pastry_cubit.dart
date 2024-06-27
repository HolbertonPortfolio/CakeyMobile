import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'add_pastry_state.dart';

class AddPastryCubit extends Cubit<AddPastryState> {
  AddPastryCubit() : super(AddPastryInitial());

  final currentStep = BehaviorSubject<int>.seeded(1);

  void nextStep() {
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

  @override
  Future<void> close() {
    currentStep.close();
    return super.close();
  }
}