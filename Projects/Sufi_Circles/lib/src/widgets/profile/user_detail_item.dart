import 'package:flutter/material.dart';

class UserDetailItem extends StatelessWidget {
  final String label;
  final String value;
  final String screenName;

  const UserDetailItem(
      {Key key, this.value, this.label, this.screenName = "profile"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 10.0),
      width: size.width,
      child: FlatButton(
        onPressed: (){},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 20.0, fontFamily: "CreteRound"),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(value, style: TextStyle(fontFamily: "Comfortaa")),
                Icon(
                    screenName == "profile"
                        ? Icons.mode_edit
                        : Icons.arrow_right,
                    size: 20)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.grey, thickness: 0.5, height: 0),
            ),
          ],
        ),
      ),
    );
  }
}
