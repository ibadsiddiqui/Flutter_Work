import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedDialFab extends StatefulWidget {
  final List<IconData> icons;
  final List<Function> functions;
  final List<String> tooltips;
  final String mainToopTip;

  const SpeedDialFab(
      {Key key, this.icons, this.functions, this.mainToopTip, this.tooltips})
      : super(key: key);

  @override
  State createState() => new SpeedDialFabState();
}

class SpeedDialFabState extends State<SpeedDialFab>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).backgroundColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: new List.generate(widget.icons.length, (int index) {
        Widget child = new Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: new ScaleTransition(
            scale: new CurvedAnimation(
              parent: _controller,
              curve: new Interval(0.0, 1.0 - index / widget.icons.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: new FloatingActionButton(
              heroTag: null,
              tooltip: widget.tooltips[index],
              backgroundColor: backgroundColor,
              mini: true,
              child: new Icon(widget.icons[index], color: foregroundColor),
              onPressed: () {
                _controller.reverse();
                widget.functions[index]();
              },
            ),
          ),
        );
        return child;
      }).toList()
        ..add(
          new FloatingActionButton(
            heroTag: null,
            tooltip: widget.mainToopTip,
            backgroundColor: foregroundColor,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform:
                      new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(
                      _controller.isDismissed ? Icons.add : Icons.close),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
    );
  }
}
