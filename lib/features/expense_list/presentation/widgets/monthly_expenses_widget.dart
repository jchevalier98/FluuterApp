import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expense_categories_bloc.dart';
import 'util/item.dart';
import 'util/separator.dart';

class MonthlyExpensesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpenseCategoriesBloc, ExpenseCategoriesState>(
      listener: (context, state) {
        if (state is ExpenseCategoriesLoaded) {
          print("Categories: ${state.categories}");
        }
      },
      child: BlocBuilder<ExpenseCategoriesBloc, ExpenseCategoriesState>(
        builder: (context, state) {
          if (state is ExpenseCategoriesLoading) {
            return CircularProgressIndicator();
          } else if (state is ExpenseCategoriesLoaded) {
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(15.0),
                itemCount: state.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = state.categories[index];
                  return Item(name: data.name, percent: 80, amount: data.total);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Separator(
                    space: 1.0,
                  );
                },
              ),
            );
          } else if (state is ExpenseCategoriesInitial) {
            return Text("Los registros no se han cargado");
          } else {
            return Text("Error");
          }
        },
      ),
    );
  }
}
