import 'package:flutter/material.dart';

class Order extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Ordenes", 
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}