import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Expense extends Equatable {
  final String id;
  final double amount;
  final String date;
  final String category;
  final int day;
  final int month;
  final int year;

  Expense(
      {@required this.id,
      this.amount,
      this.date,
      this.category,
      this.month,
      this.day,
      this.year});

  @override
  List<Object> get props => [id, amount, date, category, month, day, year];
}
