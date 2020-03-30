part of 'expense_categories_bloc.dart';

abstract class ExpenseCategoriesState extends Equatable {
  const ExpenseCategoriesState();
}

class ExpenseCategoriesInitial extends ExpenseCategoriesState {
  @override
  List<Object> get props => [];
}

class ExpenseCategoriesLoading extends ExpenseCategoriesState {
  @override
  List<Object> get props => [];
}

class ExpenseCategoriesLoaded extends ExpenseCategoriesState {
  final List<ExpenseCategory> categories;
  final double total;
  final List<double> perDay;

  ExpenseCategoriesLoaded({@required this.categories, @required this.total, @required this.perDay});
  @override
  List<Object> get props => [categories];
}

class ExpenseCategoriesErrorState extends ExpenseCategoriesState {
  @override
  List<Object> get props => [];
  
}