import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:navigation_bar/features/expense_list/data/datasources/firebase_expenses_datasource.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';

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
      return Right(20.00);
    } on Exception {
      return Left(GeneralFailure());
    }
  }
}
