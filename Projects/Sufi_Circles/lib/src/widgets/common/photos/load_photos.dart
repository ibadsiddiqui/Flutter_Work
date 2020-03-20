import 'package:flutter/material.dart';

Widget loadPhotos(ImageChunkEvent progress) {
  return CircularProgressIndicator(
    value: progress.expectedTotalBytes != null
        ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes
        : null,
  );
}
