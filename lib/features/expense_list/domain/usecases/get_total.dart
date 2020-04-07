import 'package:dartz/dartz.dart';
import 'package:navigation_bar/core/error/failure.dart';
import 'package:navigation_bar/features/expense_list/domain/repositories/expense_repository.dart';
import 'package:navigation_bar/features/expense_list/domain/usecases/get_expenses.dart';

class GetTotal implements UseCase<num, NoParams> {
  final ExpenseRepository repository;

  GetTotal(this.repository);

  @override
  Future<Either<Failure, num>> call(NoParams params) {
    return repository.total;
  }
}
