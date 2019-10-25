import 'package:flutter/rendering.dart';

BoxDecoration dashboardTopTabBackground({String path = ""}) {
  return new BoxDecoration(
    image: DecorationImage(
      image: AssetImage(path),
      fit: BoxFit.cover,
      repeat: ImageRepeat.noRepeat,
      colorFilter: ColorFilter.srgbToLinearGamma(),
    ),
  );
}
