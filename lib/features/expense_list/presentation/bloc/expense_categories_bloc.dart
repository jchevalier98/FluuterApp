import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/category.dart';
import '../../data/repositories/expenses_category_repository.dart';
import '../../domain/entities/expense.dart';
import 'expenses_bloc.dart';

part 'expense_categories_event.dart';
part 'expense_categories_state.dart';

class ExpenseCategoriesBloc
    extends Bloc<ExpenseCategoriesEvent, ExpenseCategoriesState> {
  final ExpensesCategoryRepository repository;
  final ExpensesBloc expensesBloc;

  ExpenseCategoriesBloc({
    @required this.expensesBloc,
    @required this.repository,
  });

  @override
  ExpenseCategoriesState get initialState => ExpenseCategoriesInitial();

  @override
  Stream<ExpenseCategoriesState> mapEventToState(
    ExpenseCategoriesEvent event,
  ) async* {
    yield ExpenseCategoriesLoading();
    if (event is LoadExpenseCategoriesEvent) {
      final categories = await repository.categories;
      final total = await repository.total;
      final perDay = await repository.perDay;
      yield ExpenseCategoriesLoaded(
          categories: categories, total: total, perDay: perDay);
    } else {
      yield ExpenseCategoriesLoading();
    }
  }
}
