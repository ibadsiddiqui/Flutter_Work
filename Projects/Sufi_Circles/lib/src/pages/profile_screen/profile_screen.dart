import 'dart:io';

import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/camera/camera.dart';
import 'package:Sufi_Circles/src/services/storage/ImageStorage.dart';
import 'package:Sufi_Circles/src/widgets/common/speed_dial/speed_dial_fab.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserDBController userDBController = UserDBController();

  bool _isFullNameEdit = false;
  bool _isCountryEdit = false;
  bool _isCityEdit = false;
  bool _isUploading = false;

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  _toggleNameEdit() => this.setState(() => _isFullNameEdit = !_isFullNameEdit);

  _toggleCountryEdit() => this.setState(() => _isCountryEdit = !_isCountryEdit);

  _toggleCityEdit() => this.setState(() => _isCityEdit = !_isCityEdit);

  void _setImage(context, String from, {String cameraPath = ""}) async {
    ImageStorage imageStorage = ImageStorage();
    UserModel userModel = Provider.of<UserModel>(context);
    if (from == "media") {
      File _image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (_image != null) {
        this.setState(() => _isUploading = !_isUploading);
        String filePath = _image.path;
        String url = await imageStorage.uploadUserProfilePicture(
            userModel.userID, filePath);
        userModel.setUserProfilePic(url);
        this.setState(() => _isUploading = !_isUploading);
      }
    } else {
      Navigator.of(context).pop();
      this.setState(() => _isUploading = !_isUploading);
      String url = await imageStorage.uploadUserProfilePicture(
          userModel.userID, cameraPath);
      userModel.setUserProfilePic(url);
      this.setState(() => _isUploading = !_isUploading);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> toolTips = ["Gallery", "Camera"];
    List<Function> speedDialFunctions = [
      () => _setImage(context, "media"),
      () async {
        final cameras = await availableCameras();
        pushScreen(context,
            screen: TakePictureScreen(
              camera: cameras.first,
              setImage: (String path) =>
                  _setImage(context, "camera", cameraPath: path),
            ));
      },
      () {
        userDBController.resetProfilePicture(context);
        this.setState(() {});
      }
    ];

    return Consumer<UserModel>(
      builder: (__, UserModel data, Widget child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: SpeedDialFab(
            icons: data.profilePicture == data.placeHolder
                ? [Icons.add_photo_alternate, Icons.camera]
                : [Icons.add_photo_alternate, Icons.camera, Icons.close],
            mainToopTip: "Add Profile Picture",
            tooltips: data.profilePicture == data.placeHolder
                ? toolTips
                : toolTips + ["Remove Picture"],
            functions: speedDialFunctions,
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: size.height * 0.35,
                  pinned: true,
                  backgroundColor: Color(0xFF072247),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Profile Information",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .apply(color: Colors.white, fontFamily: "CreteRound"),
                    ),
                    background: _isUploading
                        ? Loader()
                        : HeroAnimation(photoPath: data.profilePicture),
                  ),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                UserDetailItem(
                    isEditable: _isFullNameEdit,
                    inputLabel: "Full Name",
                    value: data.name,
                    toggleEdit: _toggleNameEdit,
                    onSubmit: (String name) async {
                      data.setUserName(name);
                      _toggleNameEdit();
                      await userDBController.updateUserName(context);
                    }),
                UserDetailItem(
                  isEditable: false,
                  inputLabel: "Email",
                  toggleEdit: () {},
                  value: data.email,
                ),
                UserDetailItem(
                  isEditable: _isCountryEdit,
                  inputLabel: "Country",
                  value: data.country,
                  toggleEdit: _toggleCountryEdit,
                  onSubmit: (String country) async {
                    data.setUserCountry(country);
                    _toggleCountryEdit();
                    await userDBController.updateUserCountry(context);
                  },
                ),
                UserDetailItem(
                  isEditable: _isCityEdit,
                  inputLabel: "City",
                  value: data.city,
                  toggleEdit: _toggleCityEdit,
                  onSubmit: (String city) async {
                    data.setUserCity(city);
                    _toggleCityEdit();
                    await userDBController.updateUserCity(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
