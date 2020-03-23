import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:navigation_bar/model/expense.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final List<Expense> expenses = [];

  @override
  ExpensesState get initialState => ExpensesInitial();

  @override
  Stream<ExpensesState> mapEventToState(
    ExpensesEvent event,
  ) async* {
    yield ExpensesLoading();

    if (event is AddExpense) {
      expenses.add(event.expense);
      yield ExpensesLoaded(expenses: expenses);
    } else if (event is RemoveExpense) {
      // TODO: Añadir la lógica para remover un gasto
      yield ExpensesLoaded(expenses: expenses);
    } else if (event is EditExpense) {
      // TODO: Añadir la lógica para remover un gasto
      yield ExpensesLoaded(expenses: expenses);
    } else {
      yield ExpensesError();
    }
  }
}
