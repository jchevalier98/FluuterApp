import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/selector.dart';
import 'package:navigation_bar/util/separator.dart';

import 'expensas.dart';
import 'grafics.dart';
import 'list_data.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Selector(),
          Expensas(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Grafics(),
          ),
          //Separator(space: 20.0),
          Container(
            color: Colors.blueAccent.withOpacity(0.15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Detalle de gastos",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blueGrey
                  ),
                )
              ),
            ),
          ),
          ListData()
        ],
      ),
    );
  }
} 