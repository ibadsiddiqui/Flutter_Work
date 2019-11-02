import 'package:flutter/material.dart';

class UserDetailLabel extends StatelessWidget {
  final String label;
  const UserDetailLabel({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 20.0, fontFamily: "CreteRound"),
      textAlign: TextAlign.left,
    );
  }
}
