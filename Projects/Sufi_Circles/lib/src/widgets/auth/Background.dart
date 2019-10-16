import 'package:flutter/material.dart';

BoxDecoration buildAuthBackground() {
  return new BoxDecoration(
    image: DecorationImage(
      image: AssetImage("asset/images/backgrounds/auth.png"),
      alignment: Alignment.center,
      fit: BoxFit.cover,
    ),
  );
}
