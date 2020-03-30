import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:navigation_bar/features/expense_list/data/models/expense.dart';

abstract class FirebaseExpensesDataSource {
  Future<List<Expense>> getExpenses();
}

class FirebaseExpensesDataSourceImpl implements FirebaseExpensesDataSource {
  List<Expense> _expenses = [];
  final logger = Logger();
  List<DocumentSnapshot> _documents = [];
  int currentPage = DateTime.now().month;

  Stream<QuerySnapshot> _query;

  FirebaseExpensesDataSourceImpl() {
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