import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_bar/features/expense_list/presentation/widgets/category_selector_widget.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int amount = 0;
  var realValue;
  String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Categoria",
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF85e938).withOpacity(0.7),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        _categorySelector(),
        _currentValue(),
        _numpad(),
        _submit()
      ],
    );
  }

  Widget _categorySelector() {
    return Container(
      height: 90.0,
      child: CategorySelectionWidget(
        categories: {
          "Comida": Icons.shopping_cart,
          "P. Auto": Icons.time_to_leave,
          "P. Hipo": Icons.home,
          "T. Credito": Icons.credit_card,
          "Celuar": Icons.phone_iphone,
          "Salidas": Icons.directions_run,
          "Ropa": FontAwesomeIcons.tshirt,
          "Alcohol": FontAwesomeIcons.beer,
          "Otros": Icons.beach_access,
          //"Añadir": Icons.add,
        },
        onValueChanged: (newCategory) => category = newCategory,
      ),
    );
  }

  Widget _currentValue() {
    realValue = amount / 100.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Text(
        "\$${realValue.toStringAsFixed(2)}",
        style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w500,
            color: Colors.blueAccent),
      ),
    );
  }

  Widget _num(double heigth, String text) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (text == ',') {
              amount = amount * 100;
            } else {
              amount = amount * 10 + int.parse(text);
            }
          });
        },
        child: Container(
            height: heigth,
            color: Color(0xFF262aaa),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 35.0),
            ))));
  }

  Widget _numpad() {
    return Expanded(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      var heigth = constraint.biggest.height / 4;
      return Table(
        border: TableBorder.all(color: Color(0xFF262aaa), width: 1.0),
        children: [
          TableRow(children: [
            _num(heigth, '1'),
            _num(heigth, '2'),
            _num(heigth, '3'),
          ]),
          TableRow(children: [
            _num(heigth, '4'),
            _num(heigth, '5'),
            _num(heigth, '6'),
          ]),
          TableRow(children: [
            _num(heigth, '7'),
            _num(heigth, '8'),
            _num(heigth, '9'),
          ]),
          TableRow(children: [
            _num(heigth, ','),
            _num(heigth, '0'),
            GestureDetector(
                onTap: () {
                  setState(() {
                    amount = amount ~/ 10;
                  });
                },
                child: Container(
                  color: Color(0xFF262aaa),
                  height: heigth,
                  child: Center(
                    child: Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ))
          ]),
        ],
      );
    }));
  }

  Widget _submit() {
    return Builder(builder: (BuildContext context) {
      return Hero(
          tag: "add_button",
          child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF85e938),
            ),
            child: MaterialButton(
                child: Text(
                  "Guardar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  if (amount > 0 && category != null) {
                    Firestore.instance
                        .collection('expenses')
                        .document()
                        .setData({
                      "category": category,
                      "amount": realValue,
                      "day": DateTime.now().day,
                      "month": DateTime.now().month
                    });
                    Navigator.of(context).pop();
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Recuerde seleccionar la cateegoria y monto"),
                    ));
                  }
                }),
          ));
    });
  }
}
