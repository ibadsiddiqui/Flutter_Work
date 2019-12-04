import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/camera/camera.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_photos_widgets/image_viewer.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/venue_photos_widgets/photos_list.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/fab/fab.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:provider/provider.dart';

class AddVenuePhotos extends StatefulWidget {
  final Function moveToNextPage;

  AddVenuePhotos({Key key, this.moveToNextPage}) : super(key: key);

  @override
  _AddVenuePhotosState createState() => _AddVenuePhotosState();
}

class _AddVenuePhotosState extends State<AddVenuePhotos> {
  String selectedPhoto = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  selectPhoto(String path) => this.setState(() => selectedPhoto = path);

  void setImage(context, String from, {String cameraPath = ""}) async {
    EventModel eventModel = Provider.of<EventModel>(context);
    if (from == "media") {
      var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (_image != null) {
        String filePath = _image.path;
        eventModel.addEventVenuePhoto(filePath);
      }
    } else {
      Navigator.of(context).pop();
      eventModel.addEventVenuePhoto(cameraPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomFABs(
        toolTip1: "Add photo image from Photos",
        toolTip2: "Add photo image from Camera",
        icon1: Icon(Icons.add_photo_alternate),
        icon2: Icon(Icons.camera),
        onPress1: () => setImage(context, "media"),
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
      body: Container(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Consumer<EventModel>(
          builder: (_, data, __) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: FormHeading(
                    heading: "Add photos for the venue. (optional)"),
              ),
              ImageViewer(imagePath: selectedPhoto),
              Container(
                child: Observer(
                  builder: (_) => Column(
                    children: <Widget>[
                      data.eventVenuePhoto.isNotEmpty
                          ? PhotosListView(
                              photos: data.eventVenuePhoto,
                              selectedPhoto: selectedPhoto,
                              selectPhoto: selectPhoto,
                            )
                          : Container(),
                      data.eventVenuePhoto.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.arrow_left, size: 30),
                                Text(
                                  'move',
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Icon(Icons.arrow_right, size: 30)
                              ],
                            )
                          : Text(
                              "Skip",
                              style: Theme.of(context).textTheme.body2,
                            ),
                    ],
                  ),
                ),
              ),
              RoundClippedButton(
                isMain: false,
                onPress: () => widget.moveToNextPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
