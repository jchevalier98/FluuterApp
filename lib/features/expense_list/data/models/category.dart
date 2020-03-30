import 'package:equatable/equatable.dart';

class ExpenseCategory extends Equatable{
  final String name;
  final String id;
  double total;
  final int month;
  ExpenseCategory({this.id, this.name, this.month, this.total});

  @override
  List<Object> get props => [name];
}