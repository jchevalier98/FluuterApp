import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:navigation_bar/features/expense_list/data/models/category.dart';
import 'package:navigation_bar/features/expense_list/data/models/expense.dart';

import '../../data/repositories/expenses_category_repository.dart';
import '../../data/repositories/expenses_repository.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;
  final ExpensesCategoryRepository categoriesRepository;

  ExpensesBloc({this.repository, this.categoriesRepository});

  @override
  ExpensesState get initialState => ExpensesInitial();

  @override
  Stream<ExpensesState> mapEventToState(
    ExpensesEvent event,
  ) async* {
    yield ExpensesLoading();
    if (event is LoadExpenses) {
      repository.initializeRepository();
      final expenses = await repository.expenses;
      yield ExpensesLoaded(expenses: expenses, expensesCategories: []);
    } else if (event is AddExpense) {
      repository.addExpense(event.expense);
      repository.initializeRepository();
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
