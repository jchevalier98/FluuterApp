import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:navigation_bar/features/expense_list/data/model/category.dart';
import 'package:navigation_bar/features/expense_list/data/model/expense.dart';

import '../features/expense_list/data/model/expenses_repository.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;

  ExpensesBloc({this.repository});

  @override
  ExpensesState get initialState => ExpensesInitial();

  @override
  Stream<ExpensesState> mapEventToState(
    ExpensesEvent event,
  ) async* {
    yield ExpensesLoading();
    if (event is LoadExpenses) {
      repository.fetchExpenses();
      final expenses = await repository.expenses;
      final expensesCategories = repository.getCategories();
      yield ExpensesLoaded(expenses: expenses, expensesCategories: expensesCategories);
    } else if (event is AddExpense) {
      repository.addExpense(event.expense);
      repository.fetchExpenses();
      final expenses = await repository.expenses;
      yield ExpensesLoaded(expenses: expenses);
    } else if (event is RemoveExpense) {
      // TODO: Añadir la lógica para remover un gasto
      yield ExpensesLoaded(expenses: await repository.expenses);
    } else if (event is EditExpense) {
      // TODO: Añadir la lógica para remover un gasto
      yield ExpensesLoaded(expenses: await repository.expenses);
    } else {
      yield ExpensesError();
    }
  }
}
