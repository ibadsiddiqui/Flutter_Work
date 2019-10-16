import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              color: Colors.transparent,
              onPressed: () => {},
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
