import 'package:flutter/rendering.dart';

BoxDecoration onBoardBackground() {
  return new BoxDecoration(
    image: DecorationImage(
        image: AssetImage("asset/images/backgrounds/onboard.jpg"),
        fit: BoxFit.cover,
        alignment: Alignment.center,
        colorFilter: ColorFilter.srgbToLinearGamma()),
  );
}
