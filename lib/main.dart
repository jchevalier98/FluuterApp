import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/add_page.dart';

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
      routes: {
        '/': (BuildContext context) => Home(),
        '/add' : (BuildContext context) => AddPage(),
      }
    );
  }
}
