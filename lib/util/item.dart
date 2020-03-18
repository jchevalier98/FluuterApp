
import 'package:flutter/material.dart';

class Item extends StatelessWidget {

  final IconData icon;
  final String name;
  final int percent; 
  final double amount; 

  const Item({Key key, this.icon, this.name, this.percent, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30.0, color: const Color(0xFF262AAA)),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        "%$percent del total",
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.blueGrey
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\$$amount",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ),
    );
  }
} 