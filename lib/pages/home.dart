import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Inicio", 
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}