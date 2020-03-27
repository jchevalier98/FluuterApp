import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../bloc/expenses_bloc.dart';
import '../../data/model/expense.dart';
import '../util/graph_bar_widget.dart';
import '../util/item.dart';
import '../util/separator.dart';


class MonthWidget extends StatefulWidget {
  final List<Expense> expenses;
  final List<DocumentSnapshot> documents;
  final double total;
  final List<double> perDay;
  final Map<String, double> categories;

  MonthWidget({Key key, this.documents, this.expenses})
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
        super(key: key);
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
           
          ],
        ),
         _monthlyExpenses(),
        // _listData()
      ],
    ));
  }

  Widget _monthlyExpenses() {
    return BlocBuilder<ExpensesBloc, ExpensesState>(
      builder: (context, state) {
        if (state is ExpensesLoading) {
          return CircularProgressIndicator();
        } else if (state is ExpensesLoaded) {
          return Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(15.0),
              itemCount: state.expensesCategories.length,
              itemBuilder: (BuildContext context, int index) {
                var key = state.expensesCategories.elementAt(index);
                var data = state.expensesCategories[index];
                return Item(name: data.name, percent: 80, amount: data.total);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Separator(
                  space: 1.0,
                );
              },
            ),
          );
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
                color: Color(0xFF0b1dab)),
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
              name: key, percent: 100 * data ~/ widget.total, amount: data);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Separator(
            space: 1.0,
          );
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
        return Center(
          child: RaisedButton(
            child:  Center(child: Text("Cargar gastos")),
            onPressed: () {
              ExpensesBloc expensesBloc = BlocProvider.of<ExpensesBloc>(context);
              expensesBloc.add(
                LoadExpenses(),
              );
            },
          ),
        );
      },
    );
  }
}
