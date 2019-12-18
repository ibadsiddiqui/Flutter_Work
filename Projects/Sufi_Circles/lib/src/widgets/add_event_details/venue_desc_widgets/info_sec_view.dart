import 'package:flutter/material.dart';

class InfoSecView extends StatelessWidget {
  final String text;
  final String placeholder;
  InfoSecView({Key key, this.text, this.placeholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(placeholder, style: Theme.of(context).textTheme.body2),
          Text(
            text,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.body2.apply(fontWeightDelta: 700),
          ),
        ],
      ),
    );
  }
}
