import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.0,
      width: 128.0,
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: new ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: new BorderRadius.circular(20.0),
          child: Image.asset("asset/icons/app_icons/app_icon.png"),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 1.0,
        ),
        shape: BoxShape.circle,
        //image: DecorationImage(image: this.logo)
      ),
    );
  }
}
