import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({this.onPressed});

  final Function onPressed;

  Image _buildLogo() {
    return Image.asset(
      "assets/g-logo.png",
      height: 18.0,
      width: 18.0,
    );
  }

  Opacity _buildText() {
    return Opacity(
      opacity: 0.54,
      child: Text(
        "Sign in with Google",
        style: TextStyle(
          fontFamily: 'Roboto-Medium',
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed(),
      height: 40.0,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildLogo(),
          SizedBox(width: 24.0),
          _buildText(),
        ],
      ),
    );
  }
}
