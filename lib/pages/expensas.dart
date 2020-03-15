import 'package:flutter/material.dart';

class Expensas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "\$2341.20",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
        ),
        Center(
          child: Text(
            "Total de gastos",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blueGrey
            ),
          ),
        ),
      ],
    );
  }
} 