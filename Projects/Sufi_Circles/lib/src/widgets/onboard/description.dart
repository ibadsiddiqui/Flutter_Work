import 'package:flutter/material.dart';

class OnBoardDescription extends StatelessWidget {
  final String desc;

  const OnBoardDescription({Key key, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc,
        style: TextStyle(
            fontSize: 16, color: Colors.grey, fontFamily: "Comfortaa"),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
