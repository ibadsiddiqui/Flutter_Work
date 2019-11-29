import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  BottomButton({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              onPressed: () => onPressed(context),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(fontFamily: "Comfortta"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
