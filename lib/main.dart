import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_bar/pages/add_page.dart';


import 'bloc/expenses_bloc.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white
      ),
      home: BlocProvider(
        create: (context) => ExpensesBloc(),
        child: Home(),
      ),
      routes: {
        '/add' : (BuildContext context) => AddPage(),
      }
    );
  }
}
