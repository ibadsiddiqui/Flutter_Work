import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String value;
  final Function onChanged;
  final List<String> list;

  const DropDown({Key key, this.value, this.onChanged, this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      style: TextStyle(color: Colors.black),
      underline: Container(height: 2, color: Colors.grey),
      onChanged: onChanged,
      items: list
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(fontSize: 15.0)),
            ),
          ).toList(),
    );
  }
}
