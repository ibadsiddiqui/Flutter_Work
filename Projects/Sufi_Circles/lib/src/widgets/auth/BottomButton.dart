import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  const BottomButton({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
            left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
        alignment: Alignment.center,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new FlatButton(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                color: Colors.transparent,
                onPressed: () => onPressed(context),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Comfortaa",
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
