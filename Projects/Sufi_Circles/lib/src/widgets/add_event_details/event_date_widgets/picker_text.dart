import 'package:flutter/material.dart';

class PickerText extends StatelessWidget {
  final String text;
  const PickerText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.body2,
      ),
    );
  }
}
