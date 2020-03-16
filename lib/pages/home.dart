import 'package:flutter/material.dart';
import 'package:navigation_bar/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:navigation_bar/bottombar/bottom_action.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_bar/pages/body.dart';

class Home extends StatelessWidget with NavigationStates{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BottomBar(icon: FontAwesomeIcons.home),
          BottomBar(icon: FontAwesomeIcons.chartPie),
          SizedBox(width: 30),
          BottomBar(icon: FontAwesomeIcons.wallet),
          BottomBar(icon: Icons.settings),
        ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF42c119),
        child: Icon(Icons.add),
        onPressed: (){}
      ),
      body: Body(),
    );
  }
}