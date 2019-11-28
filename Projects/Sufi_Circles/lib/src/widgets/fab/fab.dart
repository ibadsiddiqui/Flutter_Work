import 'package:flutter/material.dart';

class BottomFABs extends StatelessWidget {
  final String toolTip1;
  final String toolTip2;
  final Function onPress2;
  final Function onPress1;
  final Icon icon1;
  final Icon icon2;
  const BottomFABs(
      {Key key,
      this.onPress2,
      this.onPress1,
      this.toolTip1,
      this.toolTip2,
      this.icon1,
      this.icon2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).backgroundColor,
              heroTag: toolTip1,
              tooltip: toolTip1,
              child: icon1,
              onPressed: onPress1,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: toolTip2,
              tooltip: toolTip2,
              backgroundColor: Theme.of(context).backgroundColor,
              child: icon2,
              onPressed: onPress2,
            ),
          ),
        ],
      ),
    );
  }
}
