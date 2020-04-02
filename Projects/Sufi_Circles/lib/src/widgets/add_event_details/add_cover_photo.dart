import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/camera/camera.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_photos_widgets/image_viewer.dart';
import 'package:Sufi_Circles/src/widgets/common/observer/observer.dart';
import 'package:Sufi_Circles/src/widgets/fab/fab.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddEventCoverPhoto extends StatelessWidget {
  final Function moveToNextPage;

  AddEventCoverPhoto({Key key, this.moveToNextPage}) : super(key: key);

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
    return Consumer<EventModel>(
      builder: (_, data, __) => Container(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: FormHeading(heading: "Add cover photo for the event.*"),
            ),
            ObserveWidget(
              child: Container(
                child: isPicPlaceholder(data.eventCoverPhoto)
                    ? ImageViewer(imagePath: "")
                    : ImageViewer(imagePath: data.eventCoverPhoto),
              ),
            ),
            ObserveWidget(
              child: BottomFABs(
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
                    if (isPicPlaceholder(data.eventCoverPhoto)) {
                      final cameras = await availableCameras();
                      pushScreen(
                        context,
                        screen: TakePictureScreen(
                          camera: cameras.first,
                          setImage: (String path) =>
                              setImage(context, "camera", cameraPath: path),
                        ),
                      );
                    } else
                      moveToNextPage();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
