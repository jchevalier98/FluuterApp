import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/expense.dart';

abstract class ExpenseDataSource {
  Future<List<Expense>> getExpenses();
}

class FirebaseExpensesDataSource implements ExpenseDataSource {
  List<Expense> _expenses = [];
  final logger = Logger();
  int currentPage = DateTime.now().month - 1;

  List<DocumentSnapshot> _documents = [];
  Stream<QuerySnapshot> _query;

  FirebaseExpensesDataSource() {
    initializeRepository();
  }

  void initializeRepository() {
    _query = Firestore.instance
        .collection('expenses')
        .where("month", isEqualTo: currentPage)
        .snapshots();

    _query.listen(
      (data) => data.documents.forEach((doc) {
        _documents.add(doc);
        logger.i("Guardando gasto");
        logger.i("_documents: $_documents");
        addExpense(Expense(
            amount: 0.0 + doc.data['amount'],
            category: doc.data['category'],
            day: doc.data['day'],
            month: doc.data['month'],
            id: "019"));
      }),
    );
    logger.i("Cargando desde Firebase");
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  @override
  Future<List<Expense>> getExpenses() {
    return Future.value(_expenses);
  }
}
