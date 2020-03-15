import 'package:flutter/material.dart';
import 'package:navigation_bar/bloc.navigation_bloc/navigation_bloc.dart';

class Account extends StatelessWidget with NavigationStates{
   @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Cuenta", 
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
} 