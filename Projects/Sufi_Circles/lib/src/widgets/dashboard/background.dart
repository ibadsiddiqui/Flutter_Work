import 'package:flutter/rendering.dart';

BoxDecoration dashboardTopTabBackground() {
  return new BoxDecoration(
    image: DecorationImage(
      image: AssetImage("asset/images/backgrounds/onboard.jpg"),
      fit: BoxFit.cover,
      repeat: ImageRepeat.noRepeat,
      colorFilter: ColorFilter.srgbToLinearGamma(),
    ),
  );
}
