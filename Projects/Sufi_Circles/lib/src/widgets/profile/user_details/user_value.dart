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
          child: Icon(
              value.contains("clear")|| value.contains("click")
                  ? Icons.exit_to_app
                  : Icons.mode_edit,
              size: 20),
        ),
      ],
    );
  }
}
