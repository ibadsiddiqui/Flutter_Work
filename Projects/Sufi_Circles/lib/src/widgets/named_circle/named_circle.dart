import 'package:flutter/material.dart';

class NamedCircle extends StatelessWidget {
  final String size;
  final String title;
  const NamedCircle({Key key, this.size = "Large", this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        width: size == "Large" ? 75 : 50,
        height: size == "Large" ? 75 : 50,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: size == "Large" ? 30 : 20,
            fontFamily: "CreteRound",
          ),
        ),
      ),
    );
  }
}
