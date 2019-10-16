import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key, this.title, this.onPressed}) : super(key: key);
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: new FlatButton(
                color: Color.fromRGBO(8, 51, 88, 1),
                splashColor: Color.fromRGBO(7, 34, 71, 1),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                onPressed: onPressed,
                child: Text(
                  this.title,
                  style:
                      TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
