import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_bar/util/item.dart';

class ListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => Item(icon : FontAwesomeIcons.shoppingCart, name: "Ropa", percent: 12, amount: 145.21),
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.blueAccent.withOpacity(0.15),
              height: 5.0,
            );
          },
          /*children: <Widget>[
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Ropa", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Comida", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Alcohol", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Gasolina", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Corredor", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Tarjeta credito", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Prestamo Personal", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Prestamo Auto", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Hipoteca", percent: 12, amount: 145.21),
            Item(icon : FontAwesomeIcons.shoppingCart, name: "Otro", percent: 12, amount: 145.21),
          ],*/
      ),
    );
  }
} 