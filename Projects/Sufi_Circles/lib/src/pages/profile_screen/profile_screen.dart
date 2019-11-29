import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/camera/camera.dart';
import 'package:Sufi_Circles/src/services/storage/ImageStorage.dart';
import 'package:Sufi_Circles/src/widgets/fab/fab.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserDBController userDBController = UserDBController();
  AuthController authController = AuthController();
  ImageStorage imageStorage = ImageStorage();

  bool _isFullNameEdit = false;
  bool _isEmailEdit = false;
  bool _isCountryEdit = false;
  bool _isCityEdit = false;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _toggleNameEdit() => this.setState(() => _isFullNameEdit = !_isFullNameEdit);
  _toggleEmailEdit() => this.setState(() => _isEmailEdit = !_isEmailEdit);
  _toggleCountryEdit() => this.setState(() => _isCountryEdit = !_isCountryEdit);
  _toggleCityEdit() => this.setState(() => _isCityEdit = !_isCityEdit);

  void setImage(context, String from, {String cameraPath = ""}) async {
    UserModel userModel = Provider.of<UserModel>(context);
    if (from == "media") {
      var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
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
    UserModel userModel = Provider.of<UserModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomFABs(
          toolTip1: "Add profile image from Photos",
          toolTip2: "Add profile image from Camera",
          icon1: Icon(Icons.add_photo_alternate),
          icon2: Icon(Icons.camera),
          onPress1: () => setImage(context, "media"),
          onPress2: () async {
            final cameras = await availableCameras();
            pushScreen(context,
                screen: TakePictureScreen(
                  camera: cameras.first,
                  setImage: (String path) =>
                      setImage(context, "camera", cameraPath: path),
                ));
          }),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                    : HeroAnimation(photoPath: userModel.profilePicture),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            UserDetailItem(
                isEditable: _isFullNameEdit,
                inputLabel: "Full Name",
                value: userModel.name,
                toggleEdit: _toggleNameEdit,
                onSubmit: (String name) async {
                  userModel.setUserName(name);
                  _toggleNameEdit();
                  await userDBController.updateUserName(context);
                }),
            UserDetailItem(
              isEditable: _isEmailEdit,
              inputLabel: "Email",
              value: userModel.email,
              toggleEdit: _toggleEmailEdit,
              onSubmit: (String email) async {
                userModel.setUserEmail(email);
                _toggleEmailEdit();
                await userDBController.updateUserEmail(context);
                await authController.updateFirebaseUserEmail(email, context);
              },
            ),
            UserDetailItem(
              isEditable: _isCountryEdit,
              inputLabel: "Country",
              value: userModel.country,
              toggleEdit: _toggleCountryEdit,
              onSubmit: (String country) async {
                userModel.setUserCountry(country);
                _toggleCountryEdit();
                await userDBController.updateUserCountry(context);
              },
            ),
            UserDetailItem(
              isEditable: _isCityEdit,
              inputLabel: "City",
              value: userModel.city,
              toggleEdit: _toggleCityEdit,
              onSubmit: (String city) async {
                userModel.setUserCity(city);
                _toggleCityEdit();
                await userDBController.updateUserCity(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
