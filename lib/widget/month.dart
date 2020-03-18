import 'package:flutter/material.dart';

class MonthText extends StatelessWidget {

  final String month;
  final TextStyle styleText;
  const MonthText({Key key, this.month, this.styleText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$month",
        style: styleText/*TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),*/
      ),
    );
  }
} 