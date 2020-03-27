import 'package:flutter/material.dart';

import '../widget/bottom_action.dart';
import 'body.dart';

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
            BottomBar(icon: Icons.home, isSelected: true, page: '/',),
            BottomBar(icon: Icons.show_chart, page: '/'),
            CircleAvatar(
              radius: 21.0,
              backgroundColor: Color(0xFF0b1dab),
              child: new IconButton(
                icon: new Icon(Icons.add),
                color: Colors.white,
                onPressed: () { 
                  Navigator.of(context).pushNamed('/add');
                },
              )
            ),
            BottomBar(icon: Icons.notifications_none, page: '/'),
            BottomBar(icon: Icons.perm_identity, page: '/'),
          ],
        ),
      ),
      body: Body(),
    );
  }
}