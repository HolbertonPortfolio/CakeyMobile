import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'add_pastry_state.dart';

class AddPastryCubit extends Cubit<AddPastryState> {
  AddPastryCubit() : super(AddPastryInitial());

  final titleSubject = BehaviorSubject<String>();

  @override
  Future<void> close() {
    titleSubject.close();
    return super.close();
  }
}