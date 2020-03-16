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
          Grafics(),
          Separator(space: 20.0),
          ListData()
        ],
      ),
    );
  }
} 