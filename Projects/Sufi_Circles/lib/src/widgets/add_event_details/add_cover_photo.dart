import 'dart:io';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/camera/camera.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/fab/fab.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:provider/provider.dart';

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

  @override
  void dispose() {
    super.dispose();
  }

  void setImage(context, String from, {String cameraPath = ""}) async {
    EventModel eventModel = Provider.of<EventModel>(context);
    if (from == "media") {
      var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (_image != null) {
        String filePath = _image.path;
        eventModel.setEventCoverPhoto(filePath);
      }
    } else {
      Navigator.of(context).pop();
      eventModel.setEventCoverPhoto(cameraPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<EventModel>(
      builder: (_, data, __) => Container(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Add a cover photo for the event.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF072247),
                  fontFamily: "CreteRound",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Observer(
              builder: (_) => Container(
                child: isPicPlaceholder(data.eventCoverPhoto)
                    ? Image.asset(
                        data.eventCoverPhoto,
                        height: size.height * 0.7,
                        // width: 200,
                        width: size.width,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(data.eventCoverPhoto),
                        height: size.height * 0.7,
                        // width: 200,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Observer(
              builder: (_) => BottomFABs(
                toolTip1: isPicPlaceholder(data.eventCoverPhoto)
                    ? "Add photo image from Photos"
                    : "Cancel",
                toolTip2: isPicPlaceholder(data.eventCoverPhoto)
                    ? "Add photo image from Camera"
                    : "Confirm",
                icon1: isPicPlaceholder(data.eventCoverPhoto)
                    ? Icon(Icons.add_photo_alternate)
                    : Icon(Icons.close),
                icon2: isPicPlaceholder(data.eventCoverPhoto)
                    ? Icon(Icons.camera)
                    : Icon(Icons.check),
                onPress1: () => isPicPlaceholder(data.eventCoverPhoto)
                    ? setImage(context, "media")
                    : data.resetEventCoverPhoto(),
                onPress2: () async {
                  final cameras = await availableCameras();
                  pushScreen(
                    context,
                    screen: TakePictureScreen(
                      camera: cameras.first,
                      setImage: (String path) =>
                          setImage(context, "camera", cameraPath: path),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
