import 'package:flutter/material.dart';

Widget submitButton({@required String title, Function onPress}) {
  return new RaisedButton(
    onPressed: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: 100.0, height: 57.5),
        Text(title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
        SizedBox(width: 100.0, height: 57.5),
      ],
    ),
    textColor: Colors.white,
    padding: EdgeInsets.only(left: 20.0, right: 20.0),
    color: Colors.pinkAccent,
    splashColor: Colors.pink,
    shape: StadiumBorder(),
  );
}
