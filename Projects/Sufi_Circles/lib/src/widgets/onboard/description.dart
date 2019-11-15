import 'package:flutter/material.dart';

class OnBoardDescription extends StatelessWidget {
  final String desc;

  const OnBoardDescription({Key key, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Padding(
      padding: padding.flipped,
      child: Text(
        desc,
        style: TextStyle(
            fontSize: 16, color: Colors.grey, fontFamily: "Comfortaa"),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
