import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/home.dart';
import 'package:navigation_bar/sidebar/sidebar.dart';

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Home(),
          //SideBar(),
        ],
      ),
    );
  }
}