import 'dart:convert';
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
  bool isFullNameEdit = false;
  bool isEmailEdit = false;
  bool isCountryEdit = false;
  bool isCityEdit = false;
  String image = "asset/images/placeholder/cover/index.png";
  
  toggleNameEdit() => this.setState(() => isFullNameEdit = !isFullNameEdit);
  toggleEmailEdit() => this.setState(() => isEmailEdit = !isEmailEdit);
  toggleCountryEdit() => this.setState(() => isCountryEdit = !isCountryEdit);
  toggleCityEdit() => this.setState(() => isCityEdit = !isCityEdit);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getImage() async {
    var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    String strImg = base64Encode(_image.readAsBytesSync());
    print(strImg);
    // setState(() {
    //   image = ;
    // });
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF072247),
        tooltip: "Upload Profile Picture",
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
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
                  userModel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "CreteRound",
                  ),
                ),
                background: HeroAnimation(
                  photoPath: image,
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
            SizedBox(height: 20),
            UserDetailItem(
              isEditable: isFullNameEdit,
              inputLabel: "Full Name:",
              value: "Ibad Siddiqui",
              toggleEdit: toggleNameEdit,
            ),
            UserDetailItem(
              isEditable: isEmailEdit,
              inputLabel: "Email:",
              value: userModel.email,
              toggleEdit: toggleEmailEdit,
            ),
            UserDetailItem(
              isEditable: isCountryEdit,
              inputLabel: "Country:",
              value: "userModel.country",
              toggleEdit: toggleCountryEdit,
            ),
            UserDetailItem(
              isEditable: isCityEdit,
              inputLabel: "City:",
              value: "userModel.city",
              toggleEdit: toggleCityEdit,
            ),
          ],
        ),
      ),
    );
  }
}
