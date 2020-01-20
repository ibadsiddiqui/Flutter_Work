import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

BoxDecoration dashboardTopTabBackground({String path = ""}) {
  return new BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(path, scale: 10.0),
      fit: BoxFit.cover,
      repeat: ImageRepeat.noRepeat,
      colorFilter: ColorFilter.srgbToLinearGamma(),
    ),
  );
}
