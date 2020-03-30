import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/expense_list/data/datasources/firebase_expenses_datasource.dart';
import 'features/expense_list/data/repositories/expenses_category_repository.dart';
import 'features/expense_list/data/repositories/expenses_repository.dart';
import 'features/expense_list/presentation/bloc/expense_categories_bloc.dart';
import 'features/expense_list/presentation/bloc/expenses_bloc.dart';
import 'features/expense_list/presentation/pages/add_page.dart';
import 'features/expense_list/presentation/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
        home: BlocProvider(
          create: (context) {
            return ExpenseCategoriesBloc(
                repository: LocalExpenseRepository(
                    expensesRepository: FirebaseExpensesDataSourceImpl()),
                expensesBloc:
                    ExpensesBloc(repository: FakeExpensesRepository()));
          },
          child: Home(),
        ),
        routes: {
          '/add': (BuildContext context) => AddPage(),
        });
  }
}
