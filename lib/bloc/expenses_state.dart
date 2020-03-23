part of 'expenses_bloc.dart';
abstract class ExpensesState extends Equatable {
  const ExpensesState();
}

class ExpensesInitial extends ExpensesState {
  @override
  List<Object> get props => [];
}


class ExpensesLoaded extends ExpensesState {
  final List<Expense> expenses;
  ExpensesLoaded({this.expenses});
  @override
  List<Object> get props => [expenses];
}

class ExpensesLoading extends ExpensesState {
  @override
  List<Object> get props => [];
}

class ExpensesError extends ExpensesState {
  @override
  List<Object> get props => [];
}

