import 'package:flutter/material.dart';

class Separator extends StatelessWidget {

  final double space; 
  const Separator({Key key, this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.15),
      height: space,
    );
  }
} 