import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SlidingCard extends StatelessWidget {
  final String name;
  final String assetName;
  final double offset;
  final Function onPress;
  SlidingCard({
    Key key,
    @required this.name,
    @required this.assetName,
    @required this.offset,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        color: Theme.of(context).backgroundColor,
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'asset/$assetName',
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(name: name, offset: gauss, onPress: onPress),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final Function onPress;
  final double offset;

  CardContent(
      {Key key,
      @required this.name,
      @required this.offset,
      @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: Theme.of(context).textTheme.body1),
          ),
          SizedBox(height: 8),
          Spacer(),
          Container(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(32 * offset, 0),
              child: IconButton(
                  onPressed: this.onPress,
                  icon: Icon(Icons.arrow_forward, color: Colors.white)),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
