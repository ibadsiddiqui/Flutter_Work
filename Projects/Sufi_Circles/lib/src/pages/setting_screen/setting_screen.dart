import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final AuthController authController = AuthController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "CreteRound",
                  ),
                ),
                background: Consumer<UserModel>(
                  builder: (_, data, __) =>
                      HeroAnimation(photoPath: data.profilePicture),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            UserDetailItem(
              inputLabel: "Terms and Conditions",
              value: "click to view them...",
              toggleEdit: () {},
            ),
            UserDetailItem(
              inputLabel: "Contact Us",
              value: "click to view them...",
              toggleEdit: () {},
            ),
            UserDetailItem(
              inputLabel: "Sign out",
              value: "clear my session.",
              toggleEdit: () {
                authController.signOutUser();
                pushLoginScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
