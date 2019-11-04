import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AddEventCoverPhoto extends StatefulWidget {
  AddEventCoverPhoto({Key key}) : super(key: key);

  @override
  _AddEventCoverStatePhoto createState() => _AddEventCoverStatePhoto();
}

class _AddEventCoverStatePhoto extends State<AddEventCoverPhoto> {
  @override
  void initState() {
    super.initState();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() async => await getCamera();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ibasd'),
    );
  }

  getCamera() async {
    final cameras = await availableCameras();
    print(cameras);
// Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
  }
}
