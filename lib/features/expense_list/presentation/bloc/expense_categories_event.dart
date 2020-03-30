part of 'expense_categories_bloc.dart';

abstract class ExpenseCategoriesEvent extends Equatable {
  const ExpenseCategoriesEvent();
}

class ExpenseAdded extends ExpenseCategoriesEvent {
  final Expense expense;

  List<Object> get props => [expense];
  ExpenseAdded({this.expense});
}

class LoadExpenseCategoriesEvent extends ExpenseCategoriesEvent {
  @override
  List<Object> get props => [];
  
}