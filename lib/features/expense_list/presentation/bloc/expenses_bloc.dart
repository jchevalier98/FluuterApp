import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/category.dart';
import '../../domain/entities/expense.dart';
import '../../domain/usecases/get_expenses.dart';
import '../../domain/usecases/get_total.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetExpenses getExpenses;
  final GetTotal getTotal;

  ExpensesBloc({
    @required GetTotal getTotal,
    @required GetExpenses usecase,
  })  : assert(usecase != null, getTotal != null),
        getExpenses = usecase,
        getTotal = getTotal;

  @override
  ExpensesState get initialState => ExpensesInitial();

  @override
  Stream<ExpensesState> mapEventToState(
    ExpensesEvent event,
  ) async* {
    yield ExpensesLoading();
    if (event is LoadExpenses) {
      final expenses = await getExpenses(NoParams());
      yield expenses.fold(
        (failure) => ExpensesError(),
        (expense) => ExpensesLoaded(
          expenses: expense,
          expensesCategories: [
            ExpenseCategory(name: "Otros", total: 25.00),
          ],
        ),
      );
    } else {
      yield ExpensesError();
    }
  }
}
