import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  const BottomButton({Key key, this.onPressed, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          onPressed: () => onPressed(context),
          child: Text(title,
              style: TextStyle(
                fontFamily: "Comfortaa",
                color: Colors.black,
                fontSize: 18.5,
              ),
              textAlign: TextAlign.center),
        ));
  }
}
