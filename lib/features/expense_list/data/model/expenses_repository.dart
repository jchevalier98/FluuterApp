import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'category.dart';
import 'expense.dart';

abstract class ExpensesRepository {
  double get total;
  Future<List<Expense>> get expenses;
  void addExpense(Expense expense);
  void fetchExpenses();
  List<ExpenseCategory> getCategories();
}

class FirebaseExpensesRepository implements ExpensesRepository {
  List<Expense> _expenses = [];
  List<DocumentSnapshot> _documents = [];

  int currentPage = DateTime.now().month;
  Stream<QuerySnapshot> _query;

  FirebaseExpensesRepository();

  void fetchExpenses() {
    _expenses = [];
    _query = Firestore.instance
        .collection('expenses')
        .where("month", isEqualTo: currentPage)
        .snapshots();

    _query.listen(
      (data) => data.documents.forEach((doc) {
        _documents.add(doc);
        addExpense(Expense(
            amount: 0.0 + doc.data['amount'],
            category: doc.data['category'],
            date: "98",
            id: "98"));
      }),
    );
  }

  Future<List<Expense>> get expenses =>
      Future.delayed(Duration(seconds: 1), () {
        return _expenses;
      });

  double get total => 0;

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  List<ExpenseCategory> getCategories() {
    List<ExpenseCategory> prev = [];
    for (var expense in _expenses) {
      if (!prev.contains(ExpenseCategory(name: expense.category))) {
        prev.add(ExpenseCategory(name: expense.category, total: 0));
      } else {
        prev[prev.indexOf(ExpenseCategory(name: expense.category))].total +=
            expense.amount;
      }
    }
    return prev;
  }
}

class FakeExpensesRepository extends ExpensesRepository {
  List<Expense> _expenses = [Expense(amount: 45.0, id: "00", date: "00")];
  double get total => 0;

  Future<List<Expense>> get expenses =>
      Future.delayed(Duration(seconds: 1), () {
        return _expenses;
      });

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  List<DocumentSnapshot> get documents => [];

  @override
  List<ExpenseCategory> getCategories() {
    List<ExpenseCategory> prev = [];
    for (var expense in _expenses) {
      if (!prev.contains(ExpenseCategory(name: expense.category))) {
        prev.add(ExpenseCategory(name: expense.category, total: expense.amount));
      } else {
        prev[prev.indexOf(ExpenseCategory(name: expense.category))].total +=
            expense.amount;
      }
    }
    return prev;
  }

  void fetchExpenses() {}
}
