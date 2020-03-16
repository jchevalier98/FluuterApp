import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_bar/util/item.dart';
import 'package:navigation_bar/util/separator.dart';

class ListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => Item(icon : FontAwesomeIcons.shoppingCart, name: "Ropa", percent: 12, amount: 145.21),
          separatorBuilder: (BuildContext context, int index) {
            return Separator(space: 3.0,);
          },
      ),
    );
  }
} 