import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String value;
  final Function onChanged;
  final Function onPress;
  final String groupValue;
  RadioButton(
      {Key key, this.value, this.onChanged, this.onPress, this.groupValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          onChanged: onChanged,
          groupValue: groupValue,
        ),
        FlatButton(
          onPressed: () => onPress(value),
          child: Text(
            value,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
      ],
    );
  }
}
