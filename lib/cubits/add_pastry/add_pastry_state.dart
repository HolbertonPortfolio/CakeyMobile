part of 'add_pastry_cubit.dart';

sealed class AddPastryState extends Equatable {
  const AddPastryState();

  @override
  List<Object> get props => [];
}

final class AddPastryInitial extends AddPastryState {}

class AddPastryStepChanged extends AddPastryState {
  final int step;

  const AddPastryStepChanged(this.step);

  @override
  List<Object> get props => [step];
}

class AddPastryValidationError extends AddPastryState {
  final String message;

  const AddPastryValidationError(this.message);

  @override
  List<Object> get props => [message];
}