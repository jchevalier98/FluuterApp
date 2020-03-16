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
              fontWeight: FontWeight.w500,
              fontSize: 35.0,
            ),
          ),
        ),
        Center(
          child: Text(
            "Total de gastos",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey
            ),
          ),
        ),
      ],
    );
  }
} 