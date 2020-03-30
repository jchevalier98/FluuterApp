import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../datasources/firebase_expenses_datasource.dart';
import '../models/category.dart';

abstract class ExpensesCategoryRepository {
  final FirebaseExpensesDataSource expensesRepository;
  ExpensesCategoryRepository({@required this.expensesRepository});
  Future<List<ExpenseCategory>> get categories;
  Future<double> get total;
  Future<List<double>> get perDay;
}

class LocalExpenseRepository extends ExpensesCategoryRepository {
  final logger = Logger();
  final FirebaseExpensesDataSource expensesRepository;

  LocalExpenseRepository({@required this.expensesRepository});

  @override
  Future<List<ExpenseCategory>> get categories async {
    logger.i("Instancia de expenseDataSource: $expensesRepository");
    List<ExpenseCategory> prev = [];
    for (var expense in await expensesRepository.getExpenses()) {
      if (!prev.contains(ExpenseCategory(name: expense.category))) {
        prev.add(
            ExpenseCategory(name: expense.category, total: expense.amount));
      } else {
        prev[prev.indexOf(ExpenseCategory(name: expense.category))].total +=
            expense.amount;
      }
    }
    return Future.delayed(Duration(seconds: 1), () {
      return prev;
    });
    // return Future.value(prev);
  }

  @override
  Future<List<double>> get perDay async {
    final expenses = await expensesRepository.getExpenses();
    return List.generate(31, (int index) {
      return expenses
          .where((expense) {
            return expense.day == (index + 1);
          })
          .map((expense) => expense.amount)
          .fold(0.0, (a, b) => (a + b));
    });
  }

  @override
  Future<double> get total async {
    final expenses = await expensesRepository.getExpenses();
    final total = expenses.map((expense) => expense.amount).fold(0.0, (a, b) => a + b);
    return Future.value(total);
  }
}
