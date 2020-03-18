import 'package:flutter/material.dart';
import 'package:navigation_bar/widget/bottom_action.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_bar/pages/body.dart';

class Home extends StatelessWidget{
  
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
            BottomBar(icon: FontAwesomeIcons.home, isSelected: true,),
            BottomBar(icon: FontAwesomeIcons.chartPie),
            BottomBar(icon: Icons.add),
            BottomBar(icon: FontAwesomeIcons.wallet),
            BottomBar(icon: Icons.settings),
          ],
        ),
      ),
      body: Body(),
    );
  }
}