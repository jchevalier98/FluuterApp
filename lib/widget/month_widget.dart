import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_bar/bloc/expenses_bloc.dart';
import 'package:navigation_bar/model/expense.dart';
import 'package:navigation_bar/util/graph_widget.dart';
import 'package:intl/intl.dart';
import 'package:navigation_bar/util/graph_bar_widget.dart';
import 'package:navigation_bar/util/item.dart';
import 'package:navigation_bar/util/separator.dart';

class MonthWidget extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final double total;
  final List<double> perDay;
  final Map<String, double> categories;

  MonthWidget({Key key, this.documents})
      : total =
            documents.map((doc) => doc['amount']).fold(0.0, (a, b) => a + b),
        perDay = List.generate(30, (int index) {
          return documents
              .where((doc) => doc['day'] == (index + 1))
              .map((doc) => doc['amount'])
              .fold(0.0, (a, b) => a + b);
        }),
        categories = documents.fold({}, (Map<String, double> map, document) {
          if (!map.containsKey(document['category'])) {
            map[document['category']] = 0;
          }

      map[document['category']] += document['amount'];
      return map;
    }), 
    super(key : key);
  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.categories);
    return Expanded(
      child: Column(
        children: <Widget>[
          _expensas(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _grafics(),
          ),
          Container(
            color: Color(0xFFf4f4f4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                
                child: Text(
              "Detalle de gastos",
              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
            )),
          ),
        ),
        Row(
          children: <Widget>[
            AddExpensesButton(),
            _monthlyExpenses(),
          ],
        ),
        _listData()
      ],
    ));
  }

  Widget _monthlyExpenses() {
    return BlocBuilder<ExpensesBloc, ExpensesState>(
      builder: (context, state) {
        if (state is ExpensesLoaded) {
          return Column(
              children: state.expenses.map((f) {
            return Text("Monto: ${f.amount}");
          }).toList());
        } else {
          return Text("No hay registros");
        }
      },
    );
  }

  Widget _expensas() {

    double totalAmount = widget.total;
    final format = new NumberFormat("#,##0.00", "en_US");
    
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "\$${format.format(totalAmount)}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Color(0xFF0b1dab)
            ),
          ),
        ),
        Center(
          child: Text(
            "Total de gastos",
            style: TextStyle(
              fontSize: 15.0,
              color: Color(0xFF0b1dab),
            ),
          ),
        ),
      ],
    );
  }

  Widget _grafics() {
    return Container(
      height: 215,
      //child: GraphWidget(data: widget.perDay),
      child: SimpleBarChart(data: widget.perDay),
    );
  }

  Widget _listData() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(15.0),
        itemCount: widget.categories.keys.length,
        itemBuilder: (BuildContext context, int index) {
          var key = widget.categories.keys.elementAt(index);
          var data = widget.categories[key];
          return Item(
            name: key, 
            percent: 100 * data ~/ widget.total, 
            amount: data
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Separator(space: 1.0,);
        },
      ),
    );
  }
}

class AddExpensesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesBloc, ExpensesState>(
      builder: (context, state) {
        return RaisedButton(
          onPressed: () {
            ExpensesBloc expensesBloc = BlocProvider.of<ExpensesBloc>(context);
            expensesBloc.add(
              AddExpense(
                Expense(amount: 43.2, date: "24 de diciembre", id: "987"),
              ),
            );
          },
        );
      },
    );
  }
}
