import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/category.dart';
import '../entities/expense.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, List<Expense>>> get expenses;
  Future<Either<Failure, List<double>>> get perDay;
  // void addExpense(Expense expense);
  Future<Either<Failure, num>> get total;
  Future<Either<Failure, List<ExpenseCategory>>> get categories;
}
