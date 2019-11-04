import 'package:flutter/material.dart';

class RoundClippedButton extends StatelessWidget {
  final String title;
  final Function onPress;
  const RoundClippedButton({Key key, this.title, this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: FlatButton(
        color: Color(0xFFFC3C3C),
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontFamily: "CreteRound"),
        ),
      ),
    );
  }
}
