import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/expense_repository.dart';
import 'get_expenses.dart';

class GetTotalPerDay implements UseCase<List<double>, NoParams> {
  final ExpenseRepository repository;

  GetTotalPerDay(this.repository);

  @override
  Future<Either<Failure, List<double>>> call(NoParams params) async {
    return await repository.perDay;
  }
}
