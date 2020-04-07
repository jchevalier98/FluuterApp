import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expenses_bloc.dart';
import 'util/item.dart';
import 'util/separator.dart';

class MonthlyExpensesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpensesBloc, ExpensesState>(
      listener: (context, state) {
        if (state is ExpensesLoaded) {
          print("Categories: ${state.expensesCategories}");
        }
      },
      child: BlocBuilder<ExpensesBloc, ExpensesState>(
        builder: (context, state) {
          if (state is ExpensesLoading) {
            return CircularProgressIndicator();
          } else if (state is ExpensesLoaded) {
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(15.0),
                itemCount: state.expensesCategories.length,
                itemBuilder: (BuildContext context, int index) {
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
          } else if (state is ExpensesInitial) {
            return Text("Los registros no se han cargado");
          } else {
            return Text("Error");
          }
        },
      ),
    );
  }
}
