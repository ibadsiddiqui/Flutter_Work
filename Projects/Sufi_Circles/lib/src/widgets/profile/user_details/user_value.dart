import 'package:flutter/material.dart';

class UserValue extends StatelessWidget {
  final String value;
  const UserValue({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(value, style: TextStyle(fontFamily: "Comfortaa")),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.mode_edit, size: 20),
        ),
      ],
    );
  }
}
