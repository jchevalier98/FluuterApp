part of 'expenses_bloc.dart';

abstract class ExpensesState extends Equatable {
  const ExpensesState();
}

class ExpensesInitial extends ExpensesState {
  @override
  List<Object> get props => [];
}

class ExpensesLoaded extends ExpensesState {
  final perDay = [0.0, 31.0];
  final total = 20.00;
  final List<Expense> expenses;
  final List<ExpenseCategory> expensesCategories;
  ExpensesLoaded({this.expenses, this.expensesCategories});
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
