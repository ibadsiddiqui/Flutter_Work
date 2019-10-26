import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Icon leftIcon;
  final String title;
  final Function onPress;
  const DrawerItem({Key key, this.leftIcon, this.title, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: leftIcon,
              ),
              Text(title,
                  style: TextStyle(color: Color(0xFF072247), fontSize: 20)),
            ],
          ),
          Icon(Icons.arrow_right, color: Color(0xFF072247))
        ],
      ),
    );
  }
}