import 'package:flutter/material.dart';

class UserDetailLabel extends StatelessWidget {
  final String label;
  const UserDetailLabel({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.subhead.apply(
            color: label.toLowerCase().contains("delete") ? Colors.red : null,
          ),
      textAlign: TextAlign.left,
    );
  }
}
