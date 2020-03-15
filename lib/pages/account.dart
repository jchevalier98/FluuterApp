import 'package:flutter/material.dart';

class Account extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Cuenta", 
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}