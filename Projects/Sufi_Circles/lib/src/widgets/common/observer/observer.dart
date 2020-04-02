import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObserveWidget extends StatelessWidget {
  final Widget child;
  const ObserveWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => child,
    );
  }
}
