import 'package:equatable/equatable.dart';
import 'package:navigation_bar/features/expense_list/data/models/category.dart';
import 'package:navigation_bar/features/expense_list/domain/entities/expense.dart';
import 'package:meta/meta.dart';

abstract class ExpensesState extends Equatable {
  const ExpensesState();
}

class ExpensesInitial extends ExpensesState {
  @override
  List<Object> get props => [];
}

class ExpensesLoaded extends ExpensesState {
  final perDay;
  final total;
  final List<Expense> expenses;
  final List<ExpenseCategory> expensesCategories;
  ExpensesLoaded({
    @required this.perDay,
    @required this.total,
    @required this.expenses,
    @required this.expensesCategories,
  });
  @override
  List<Object> get props => [expenses, expensesCategories];
}

class ExpensesLoading extends ExpensesState {
  @override
  List<Object> get props => [];
}

class ExpensesError extends ExpensesState {
  @override
  List<Object> get props => [];
}
