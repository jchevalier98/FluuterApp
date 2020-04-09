import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/expense_list/presentation/bloc/expenses_bloc.dart';
import 'features/expense_list/presentation/pages/add_page.dart';
import 'features/expense_list/presentation/pages/home.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
        ),
        home: HomePage(),
        routes: {
          '/add': (BuildContext context) => AddPage(),
        });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExpensesBloc>(),
      child: Home(),
    );
  }
}


