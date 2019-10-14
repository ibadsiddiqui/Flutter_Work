import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(10.0),
      child: new Image.asset(
        "asset/icons/app icon/app_icon.png",
      ),
    );
  }
}
