import 'package:flutter/material.dart';

class MonthText extends StatelessWidget {

  final String month;
  const MonthText({Key key, this.month}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$month",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22.0,
        ),
      ),
    );
  }
} 