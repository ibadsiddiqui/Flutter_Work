import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key, this.title, this.onPressed}) : super(key: key);
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: this.onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 100.0, height: 57.5),
          Text(
            this.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "CreteRound",
            ),
          ),
          SizedBox(width: 100.0, height: 57.5),
        ],
      ),
      textColor: Colors.white,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      color: Color.fromRGBO(8, 51, 88, 1),
      splashColor: Color.fromRGBO(7, 34, 71, 1),
      shape: StadiumBorder(),
    );
  }
}
