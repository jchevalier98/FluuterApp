part of 'expenses_bloc.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();
}

class AddExpense extends ExpensesEvent {
  final Expense expense;
  const AddExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class RemoveExpense extends ExpensesEvent {
  final Expense expense;
  const RemoveExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class EditExpense extends ExpensesEvent {
  final Expense expense;
  const EditExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class LoadExpenses extends ExpensesEvent {
  const LoadExpenses();

  @override
  List<Object> get props => [];
}