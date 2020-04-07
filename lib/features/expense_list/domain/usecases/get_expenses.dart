import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class GetExpenses implements UseCase<List<Expense>, NoParams> {
  final ExpenseRepository repository;
  GetExpenses(this.repository);
  @override
  Future<Either<Failure, List<Expense>>> call(NoParams params) async {
    return await repository.expenses;
  }
}
