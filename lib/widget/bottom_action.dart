import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {

  final IconData icon;
  final bool isSelected;
  const BottomBar({Key key, this.icon, this.isSelected = false}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Icon(
          icon,
          //color: const Color(0xFF262AAA),
          color: isSelected ? Color(0xFF262AAA) : Color(0xFF5458d8),
        )
      ),
      onTap: () {},
    );
  }
}