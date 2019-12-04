import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String imagePath;

  const ImageViewer({Key key, this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: imagePath.isNotEmpty
          ? Image.file(File(imagePath),
              height: size.height * 0.5, fit: BoxFit.scaleDown)
          : Image.asset("asset/images/placeholder/cover/index.png",
              height: size.height * 0.5, fit: BoxFit.cover),
    );
  }
}
