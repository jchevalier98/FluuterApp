import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/expense.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, List<Expense>>> get expenses;
  // void addExpense(Expense expense);
  Future<Either<Failure, num>> get total;
}
