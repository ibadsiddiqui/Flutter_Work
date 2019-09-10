import 'package:flutter/rendering.dart';

BoxDecoration buildBackground(String path) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(path),
      fit: BoxFit.cover,
    ),
  );
}
