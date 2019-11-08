import 'dart:io';
import 'package:flutter/material.dart';

class PhotosListView extends StatelessWidget {
  final List photos;
  final String selectedPhoto;

  final Function selectPhoto;

  const PhotosListView(
      {Key key, this.photos, this.selectedPhoto, this.selectPhoto})
      : super(key: key);

  BoxDecoration buildBorder(idx) {
    return photos[idx] == selectedPhoto
        ? BoxDecoration(border: Border.all(color: Colors.blueAccent, width: 2))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 75,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (context, int idx) {
          return Container(
            decoration: buildBorder(idx),
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: InkWell(
              onTap: () => selectPhoto(photos[idx]),
              child: Image.file(File(photos[idx])),
            ),
          );
        },
      ),
    );
  }
}
