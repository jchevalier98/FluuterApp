import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/body.dart';

class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}
  
 class _HomeState extends State<Home>{ 
  
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF262AAA),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: Text("Inicio"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart,),
            title: Text("Gastos")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,),
            title: Text("Agregar")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none,),
            title: Text("Notificaciones",)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity,),
            title: Text("Perfil")
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        /*child: Row(
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
        ),*/
      ),
      body: Body(),
    );
  }
}