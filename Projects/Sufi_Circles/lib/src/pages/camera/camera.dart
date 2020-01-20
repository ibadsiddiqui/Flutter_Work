import 'dart:async';
import 'dart:io';

import 'package:Sufi_Circles/src/widgets/fab/fab.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  final Function setImage;

  const TakePictureScreen({Key key, @required this.camera, this.setImage})
      : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  String imagePath = "";
  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  takePhoto() async {
    try {
      await _initializeControllerFuture;
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      await _controller.takePicture(path);
      this.setState(() => imagePath = path);
    } catch (e) {}
  }

  resetTakePhoto() => this.setState(() => imagePath = "");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomFABs(
        toolTip1: "Cancel Camera",
        icon1: Icon(Icons.close),
        onPress1: () =>
            imagePath == "" ? Navigator.of(context).pop() : resetTakePhoto(),
        toolTip2: "Take Photo",
        icon2: imagePath == "" ? Icon(Icons.add_a_photo) : Icon(Icons.check),
        onPress2: () =>
            imagePath == "" ? takePhoto() : widget.setImage(imagePath),
      ),
      body: imagePath == ""
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return CameraPreview(_controller);
                else
                  return Center(child: CircularProgressIndicator());
              },
            )
          : Container(
              width: size.width,
              height: size.height,
              child: Image.file(File(imagePath), fit: BoxFit.cover),
            ),
    );
  }
}
