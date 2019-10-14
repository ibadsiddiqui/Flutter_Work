import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;

  const BottomButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          onPressed: () => onPressed(context),
          child: Text("Already have an account? SIGN IN",
              style: TextStyle(
                fontFamily: "Comfortaa",
                color: Colors.black,
                fontSize: 18.5,
              ),
              textAlign: TextAlign.center),
        ));
  }
}
