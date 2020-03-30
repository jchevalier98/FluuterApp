import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ExpenseListBloc extends Bloc<ExpenseListEvent, ExpenseListState> {
  @override
  ExpenseListState get initialState => InitialExpenseListState();

  @override
  Stream<ExpenseListState> mapEventToState(
    ExpenseListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
