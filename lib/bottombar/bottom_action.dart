import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {

  final IconData icon;
  const BottomBar({Key key, this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Icon(
          icon,
          color: const Color(0xFF262AAA),
        )
      ),
      onTap: () {},
    );
  }
}