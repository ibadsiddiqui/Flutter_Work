import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final Function getImage;
  final Function getCamera;

  const FAB({Key key, this.getImage, this.getCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 31, bottom: 65),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              
              // heroTag: "btn1",
              onPressed: getCamera,
              backgroundColor: Color(0xFF072247),
              child: Icon(Icons.add_a_photo),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            heroTag: "btn1",
            tooltip: "Pick from media",
            backgroundColor: Color(0xFF072247),
            onPressed: getImage,
            child: Icon(Icons.add_photo_alternate),
          ),
        ),
      ],
    );
  }
}
