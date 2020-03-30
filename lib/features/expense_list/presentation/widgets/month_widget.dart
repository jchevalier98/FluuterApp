import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/expense_categories_bloc.dart';
import 'monthly_expenses_widget.dart';
import 'util/graph_bar_widget.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCategoriesBloc, ExpenseCategoriesState>(
        builder: (context, state) {
      if (state is ExpenseCategoriesLoaded) {
        return Expanded(
            child: Column(
          children: <Widget>[
            _expensas(context),
            _grafics(),
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
            LoadExpensesButton(),
            MonthlyExpensesList(),
          ],
        ));
      } else if (state is ExpenseCategoriesLoading) {
        return CircularProgressIndicator();
      } else {
        return LoadExpensesButton();
      }
    });
  }

  Widget _expensas(BuildContext context) {
    final format = new NumberFormat("#,##0.00", "en_US");

    return BlocBuilder<ExpenseCategoriesBloc, ExpenseCategoriesState>(
      builder: (context, state) {
        if (state is ExpenseCategoriesLoaded) {
          return Column(
            children: <Widget>[
              Center(
                child: Text(
                  "\$${format.format(state.total)}",
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
        } else if (state is ExpenseCategoriesLoading) {
          return CircularProgressIndicator();
        } else {
          return Text("No cargado");
        }
      },
    );
  }

  Widget _grafics() {
    return BlocBuilder<ExpenseCategoriesBloc, ExpenseCategoriesState>(
        builder: (context, state) {
      if (state is ExpenseCategoriesLoaded) {
        return Container(
          height: 215,
          child: SimpleBarChart(data: state.perDay),
        );
      } else {
        return Text("No cargado");
      }
    });
  }
}

class LoadExpensesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCategoriesBloc, ExpenseCategoriesState>(
      builder: (context, state) {
        return Center(
          child: RaisedButton(
            child: Center(child: Text("Cargar gastos")),
            onPressed: () {
              final expensesCategoriesBloc =
                  BlocProvider.of<ExpenseCategoriesBloc>(context);
              expensesCategoriesBloc.add(
                LoadExpenseCategoriesEvent(),
              );
            },
          ),
        );
      },
    );
  }
}
