import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              onPressed: () => {},
              child: Text("Forgot your password?",
                  style: Theme.of(context).textTheme.button.apply(fontFamily: "Comfortta")),
            ),
          ),
        ],
      ),
    );
  }
}
