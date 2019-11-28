import 'package:flutter/material.dart';

class NamedCircle extends StatelessWidget {
  final String title;
  const NamedCircle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        width: 100,
        height: 100,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
