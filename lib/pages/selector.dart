import 'package:flutter/material.dart';
import 'package:navigation_bar/widget/month.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Selector extends StatefulWidget {
  @override
  _SelectorState createState() => _SelectorState();
} 

class _SelectorState extends State<Selector> {

  PageController _pageController;
  int currentPage = 2;
  Stream<QuerySnapshot> _query;
  @override
  void initState(){
    super.initState();

    _query = Firestore.instance
      .collection('expenses')
      .where("month", isEqualTo: currentPage + 1)
      .snapshots();

    _pageController = PageController(
      initialPage: 9,
      viewportFraction: 0.4,
    );
  }
   
  Widget _pageItem(String name, int position){
    var _alignment;
    var styleText; 
    final selected = TextStyle(
      fontSize: 20.0,
      color : Colors.blueGrey,
    );

    final unSelected = TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color : Colors.blueGrey.withOpacity(0.4),
    ); 

    if(position == currentPage){
      _alignment = Alignment.center;
      styleText = selected;
    }
    else if(position > currentPage){ 
      _alignment = Alignment.centerRight;
      styleText = unSelected;
    }
    else{
      _alignment = Alignment.centerLeft;
      styleText = unSelected;
    }

    return Align(
      alignment: _alignment,
      child: MonthText(month: name, styleText: styleText,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(60.0),
      child: PageView(
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
          });
        },
        controller: _pageController,
        children: <Widget>[
          _pageItem("Enero",0),
          _pageItem("Febrero",1),
          _pageItem("Marzo",2),
          _pageItem("Abril",3),
          _pageItem("Mayo",4),
          _pageItem("Junio",5),
          _pageItem("Julio",6),
          _pageItem("Agosto",7),
          _pageItem("Septiembre",8),
          _pageItem("Octubre",9),
          _pageItem("Noviembre",10),
          _pageItem("Diciembre",11),
        ],
      )
    );
  }
} 
