import 'package:get_it/get_it.dart';

import 'features/expense_list/data/datasources/firebase_expenses_datasource.dart';
import 'features/expense_list/data/repositories/expenses_repository.dart';
import 'features/expense_list/domain/repositories/expense_repository.dart';
import 'features/expense_list/domain/usecases/get_expenses.dart';
import 'features/expense_list/domain/usecases/get_total.dart';
import 'features/expense_list/presentation/bloc/expenses_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => ExpensesBloc(
      usecase: sl(),
      getTotal: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetExpenses(sl()));
  sl.registerLazySingleton(() => GetTotal(sl()));

  // Repositories
  sl.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(
      sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ExpenseDataSource>(
    () => FirebaseExpensesDataSource(),
  );
}
