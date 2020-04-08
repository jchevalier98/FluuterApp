import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_expenses.dart';
import '../../domain/usecases/get_total.dart';
import '../../domain/usecases/get_total_per_day.dart';
import 'bloc.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetExpenses getExpenses;
  final GetTotal getTotal;
  final GetTotalPerDay perDay;
  final GetCategories getCategories;

  ExpensesBloc(
      {@required GetTotalPerDay perDay,
      @required GetTotal getTotal,
      @required GetExpenses usecase,
      @required GetCategories getCategories})
      : assert(usecase != null, getTotal != null),
        getExpenses = usecase,
        getTotal = getTotal,
        perDay = perDay,
        getCategories = getCategories;

  @override
  ExpensesState get initialState => ExpensesInitial();

  @override
  Stream<ExpensesState> mapEventToState(
    ExpensesEvent event,
  ) async* {
    yield ExpensesLoading();
    if (event is LoadExpenses) {
      // TODO: Hay que revisar como se manejan estos casos. Lo ideal sería separar en diversos estados
      final expenses = await getExpenses(NoParams());
      final pd = await perDay(NoParams());
      final tot = await getTotal(NoParams());
      final categories = await getCategories(NoParams());
      yield expenses.fold(
        (failure) => ExpensesError(),
        (expense) => ExpensesLoaded(
          expenses: expense,
          expensesCategories:
              categories.fold((failure) => [], (categories) => categories),
          perDay: pd.fold((failure) => GeneralFailure(), (perDay) => perDay),
          total: tot.fold((failure) => GeneralFailure(), (total) => total),
        ),
      );
    } else {
      yield ExpensesError();
    }
  }
}
