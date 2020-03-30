import 'package:equatable/equatable.dart';

abstract class ExpenseListState extends Equatable {
  const ExpenseListState();
}

class InitialExpenseListState extends ExpenseListState {
  @override
  List<Object> get props => [];
}
