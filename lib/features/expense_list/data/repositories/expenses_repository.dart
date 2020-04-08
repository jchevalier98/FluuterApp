import 'dart:async';

import 'package:dartz/dartz.dart';
import '../models/category.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/firebase_expenses_datasource.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDataSource expenseDataSource;

  ExpenseRepositoryImpl(this.expenseDataSource);

  Future<Either<Failure, List<Expense>>> get expenses async {
    try {
      final _expenses = await expenseDataSource.getExpenses();
      return Right(_expenses);
    } on Exception {
      return Left(GeneralFailure());
    }
  }

  Future<Either<Failure, double>> get total async {
    try {
      final expenses = await expenseDataSource.getExpenses();
      final total =
          expenses.map((expense) => expense.amount).fold(0.0, (a, b) => a + b);
      return Right(total);
    } on Exception {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<double>>> get perDay async {
    try {
      final expenses = await expenseDataSource.getExpenses();
      return Right(List.generate(31, (int index) {
        return expenses
            .where((expense) {
              return expense.day == (index + 1);
            })
            .map((expense) => expense.amount)
            .fold(0.0, (a, b) => (a + b));
      }));
    } on Exception {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<ExpenseCategory>>> get categories async {
    List<ExpenseCategory> prev = [];
    for (var expense in await expenseDataSource.getExpenses()) {
      if (!prev.contains(ExpenseCategory(name: expense.category))) {
        prev.add(
            ExpenseCategory(name: expense.category, total: expense.amount));
      } else {
        prev[prev.indexOf(ExpenseCategory(name: expense.category))].total +=
            expense.amount;
      }
    }
    return Future.delayed(Duration(seconds: 1), () {
      return Right(prev);
    });
  }
}
