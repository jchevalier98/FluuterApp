import 'package:flutter/material.dart';
import 'package:navigation_bar/widget/month.dart';

class Selector extends StatelessWidget {

  /*PageController _pageController;
  void initState(){
    _pageController = PageController(
      initialPage: 9,
      viewportFraction: 0.3,
    );
  }*/
   
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(70.0),
      child: PageView(
        //controller: _pageController,
        children: <Widget>[
          MonthText(month: "Enero"),
          MonthText(month: "Febrero"),
          MonthText(month: "Marzo"),
          MonthText(month: "Abril"),
          MonthText(month: "Mayo"),
          MonthText(month: "Junio"),
          MonthText(month: "Julio"),
          MonthText(month: "Agosto"),
          MonthText(month: "Septiembre"),
          MonthText(month: "Octubre"),
          MonthText(month: "Noviembre"),
          MonthText(month: "Diciembre"),
        ],
      )
    );
  }
} 