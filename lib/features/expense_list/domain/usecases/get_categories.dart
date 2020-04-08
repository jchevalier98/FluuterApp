import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/category.dart';
import '../repositories/expense_repository.dart';
import 'get_expenses.dart';

class GetCategories implements UseCase<List<ExpenseCategory>, NoParams> {
  final ExpenseRepository repository;
  GetCategories(this.repository);
  @override
  Future<Either<Failure, List<ExpenseCategory>>> call(NoParams params) async {
    return await repository.categories;
  }
}
