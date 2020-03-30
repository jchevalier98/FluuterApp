import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {

  final IconData icon;
  final bool isSelected;
  final String page;
  const BottomBar({Key key, this.icon, this.isSelected = false, this.page}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Icon(
          icon,
          color: isSelected ? Color(0xFF262AAA) : Colors.grey.withOpacity(0.9),
        )
      ),
      onTap: () {
        Navigator.of(context).pushNamed(page);
      },
    );
  }
} 