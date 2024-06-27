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