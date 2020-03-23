
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Item extends StatelessWidget {

  final String name;
  final int percent; 
  final double amount; 

  const Item({Key key, this.name, this.percent, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    IconData icon;
    Color color;
    if(name == "Comida"){
      color = Color(0xFF1bf2f2);
      icon = Icons.shopping_cart;
    }else if (name == "P. Auto"){
      color = Color(0xFFf4383e);
      icon = Icons.time_to_leave;
    }else if (name == "P. Hipo"){
      color = Color(0xFFb1935e);
      icon = Icons.home;
    }else if (name == "T. Credito"){
      color = Color(0xFF3843f4);
      icon = Icons.credit_card;
    }else if (name == "Celuar"){
      color = Color(0xFF60f438);
      icon = Icons.phone_iphone;
    }else if (name == "Salidas"){
      color = Color(0xFF9bec2a);
      icon = Icons.directions_run;
    }else if (name == "Ropa"){
      color = Color(0xFFf438ef);
      icon = FontAwesomeIcons.tshirt;
    }else if (name == "Alcohol"){
      color = Color(0xFFe3cf0c);
      icon = FontAwesomeIcons.beer;
    }else{
      color = Color(0xFFb038f4);
      icon = Icons.beach_access;
    }

    String totalAmount = amount.toStringAsFixed(2);
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: color,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        "$percent% del total",
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.blueGrey
        ),
      ),
      trailing: Container(
        child: Container(
          child: Text(
            "\$$totalAmount",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ),
    );
  }
} 