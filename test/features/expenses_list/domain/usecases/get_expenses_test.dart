import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:navigation_bar/features/expense_list/domain/entities/expense.dart';
import 'package:navigation_bar/features/expense_list/domain/repositories/expense_repository.dart';
import 'package:navigation_bar/features/expense_list/domain/usecases/get_expenses.dart';

class MockExpensesRepository extends Mock implements ExpenseRepository {}

void main() {
  GetExpenses usecase;
  MockExpensesRepository repository;

  setUp(() {
    repository = MockExpensesRepository();
    usecase = GetExpenses(repository);
  });

  final tExpenseAmount = 1.0;
  final tExpenseCategory = "Comida";
  final tExpenseId = "1";

  final tExpense = Expense(id: "1", amount: 1.0, category: "Comida");
  final tExpenseList = [tExpense];

  test("debe traer un gasto de la lista", () async {
    when(repository.expenses).thenAnswer((_) async => Right(tExpenseList));
    final getExpenses = GetExpenses(repository);
    final result = await getExpenses(NoParams());
    expect(result, Right(tExpenseList));
    verify(repository.expenses);
    verifyNoMoreInteractions(repository);
  });
}
