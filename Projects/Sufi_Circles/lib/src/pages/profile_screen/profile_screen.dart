import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/controllers/db/DB_Controller.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/camera/camera.dart';
import 'package:Sufi_Circles/src/services/storage/ImageStorage.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:Sufi_Circles/src/widgets/profile/fab.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DBController dbController = DBController();
  AuthController authController = AuthController();
  ImageStorage imageStorage = ImageStorage();

  bool isFullNameEdit = false;
  bool isEmailEdit = false;
  bool isCountryEdit = false;
  bool isCityEdit = false;
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  toggleNameEdit() => this.setState(() => isFullNameEdit = !isFullNameEdit);
  toggleEmailEdit() => this.setState(() => isEmailEdit = !isEmailEdit);
  toggleCountryEdit() => this.setState(() => isCountryEdit = !isCountryEdit);
  toggleCityEdit() => this.setState(() => isCityEdit = !isCityEdit);

  void getImage(UserModel userModel) async {
    var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      this.setState(() => isUploading = !isUploading);
      String filePath = _image.path;
      String url = await imageStorage.uploadUserProfilePicture(
          userModel.userID, filePath);
      userModel.setUserProfilePic(url);
      this.setState(() => isUploading = !isUploading);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    final size = MediaQuery.of(context).size;
    print("asdasd" + userModel.profilePicture);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF072247),
      //   child: Icon(Icons.add_a_photo),
      //   heroTag: "btn1",
      //   onPressed: () async {
      //     final cameras = await availableCameras();
      //     pushScreen(context, screen: TakePictureScreen(camera: cameras.first));
      //   },
      // ),

      // FAB(
      // getCamera: () => pushScreen(context, screen: CameraApp),
      // getImage: () => getImage(userModel),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.35,
              pinned: true,
              backgroundColor: Color(0xFF072247),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Consumer<UserModel>(
                  builder: (_, data, __) => isUploading
                      ? Loader()
                      : HeroAnimation(photoPath: data.profilePicture),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Text(
              "Profile Information",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontFamily: "CreteRound"),
            ),
            UserDetailItem(
                isEditable: isFullNameEdit,
                inputLabel: "Full Name",
                value: userModel.name,
                toggleEdit: toggleNameEdit,
                onSubmit: (String name) async {
                  userModel.setUserName(name);
                  toggleNameEdit();
                  await dbController.updateUserName(context);
                }),
            UserDetailItem(
              isEditable: isEmailEdit,
              inputLabel: "Email",
              value: userModel.email,
              toggleEdit: toggleEmailEdit,
              onSubmit: (String email) async {
                userModel.setUserEmail(email);
                toggleEmailEdit();
                await dbController.updateUserEmail(context);
                await authController.updateFirebaseUserEmail(email, context);
              },
            ),
            UserDetailItem(
              isEditable: isCountryEdit,
              inputLabel: "Country",
              value: userModel.country,
              toggleEdit: toggleCountryEdit,
              onSubmit: (String country) async {
                userModel.setUserCountry(country);
                toggleCountryEdit();
                await dbController.updateUserCountry(context);
              },
            ),
            UserDetailItem(
              isEditable: isCityEdit,
              inputLabel: "City",
              value: userModel.city,
              toggleEdit: toggleCityEdit,
              onSubmit: (String city) async {
                userModel.setUserCity(city);
                toggleCityEdit();
                await dbController.updateUserCity(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
