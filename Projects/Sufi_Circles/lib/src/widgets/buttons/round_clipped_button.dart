import 'package:flutter/material.dart';

class RoundClippedButton extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isMain;
  final Widget child;

  RoundClippedButton(
      {Key key, this.title = "", this.onPress, this.isMain = true, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isMain) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FlatButton(
            color: Color(0xFFFC3C3C), child: child, onPressed: onPress),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(100),
            right: Radius.circular(100),
          ),
          child: RaisedButton(
            color: Color(0xFF072247),
            splashColor: Color(0xFFFC3C3C),
            elevation: 5,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            onPressed: onPress,
          ),
        ),
      );
    }
  }
}
