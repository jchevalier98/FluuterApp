import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  
  final Map<String, IconData> categories;
  final Function(String) onValueChanged;

  const CategorySelectionWidget({Key key, this.categories, this.onValueChanged}) : super(key: key);
  @override
  _CategorySelectionWidgetState createState() => _CategorySelectionWidgetState();
}

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool selected;

  const CategoryWidget({Key key, this.name, this.icon, this.selected}): super(key: key);

  @override
  Widget build(BuildContext context) {

    Color color;
    if(name == "Comida"){
      color = Color(0xFF1bf2f2);
    }else if (name == "P. Auto"){
      color = Color(0xFFf4383e);
    }else if (name == "P. Hipo"){
      color = Color(0xFFb1935e);
    }else if (name == "T. Credito"){
      color = Color(0xFF3843f4);
    }else if (name == "Celuar"){
      color = Color(0xFF60f438);
    }else if (name == "Salidas"){
      color = Color(0xFF9bec2a);
    }else if (name == "Ropa"){
      color = Color(0xFFf438ef);
    }else if (name == "Alcohol"){
      color = Color(0xFFe3cf0c);
    }else{
      color = Color(0xFFb038f4);
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: selected ? Color(0xFF262aaa) : color,
                width: selected ? 3.0 : 1.0,
              ),
            ),
            child: Icon(
              icon,
              color: selected ? Color(0xFF262aaa) : color,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: selected ? Color(0xFF262aaa) : Colors.grey.withOpacity(0.7), 
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  String currentItem = "";

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    widget.categories.forEach((name, icon) {
      widgets.add(GestureDetector(
        onTap: () {
          setState(() {
            currentItem = name;
          });
          widget.onValueChanged(name);
        },
        child: CategoryWidget(
          name: name,
          icon: icon,
          selected: name == currentItem,
        ),
      ));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widgets,
    );
  }
}