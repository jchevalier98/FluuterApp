import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/expense.dart';



abstract class ExpensesRepository {
  List<Expense> _expenses = [];

  Future<List<Expense>> get expenses;
  void addExpense(Expense expense);
  void initializeRepository();
}

class FirebaseExpensesRepository implements ExpensesRepository {
  List<DocumentSnapshot> _documents = [];

  int currentPage = DateTime.now().month;
  Stream<QuerySnapshot> _query;

  FirebaseExpensesRepository() : super();

  @override
  void initializeRepository() {
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

  Future<List<Expense>> get expenses => Future.value(_expenses);

  double get total => 0;

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  @override
  List<Expense> _expenses;
}

class FakeExpensesRepository extends ExpensesRepository {
  FakeExpensesRepository() : super();

  double get total => 0;

  Future<List<Expense>> get expenses =>
      Future.delayed(Duration(seconds: 1), () {
        return _expenses;
      });

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  void initializeRepository() {
    _expenses = [
      Expense(amount: 45.0, id: "00", date: "00", category: "Gastos varios"),
    ];
  }
}
