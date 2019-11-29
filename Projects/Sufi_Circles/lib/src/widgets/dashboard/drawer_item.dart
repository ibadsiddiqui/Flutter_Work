import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Icon leftIcon;
  final String title;
  final Function onPress;
  
  DrawerItem({Key key, this.leftIcon, this.title, this.onPress})
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
                padding: EdgeInsets.only(right: 10),
                child: leftIcon,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .apply(color: Colors.black),
              ),
            ],
          ),
          Icon(Icons.arrow_right, color: Color(0xFF072247))
        ],
      ),
    );
  }
}
