import '../../domain/entities/expense.dart';
import 'firebase_expenses_datasource.dart';

class LocalDataSource implements ExpenseDataSource {
  @override
  Future<List<Expense>> getExpenses() {
    return Future.value(
      [
        Expense(
          id: "001",
          amount: 20.00,
          category: "Otros",
        )
      ],
    );
  }
}
