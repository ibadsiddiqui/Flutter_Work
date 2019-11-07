import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';

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

  openURI(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                background: HeroAnimation(photoPath: userModel.profilePicture),
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
              toggleEdit: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          height: 200,
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Email:',
                                style: TextStyle(
                                    fontFamily: "CreteRound", fontSize: 18),
                              ),
                              FlatButton(
                                child: Text(
                                  'sufi.circles@gmail.com',
                                  style: TextStyle(fontFamily: 'Comfortaa'),
                                ),
                                onPressed: () async {
                                  await openURI(
                                      'mailto:sufi.circles@gmail.com');
                                },
                              ),
                              SizedBox(height: 40),
                              Text(
                                'Facebook:',
                                style: TextStyle(
                                    fontFamily: "CreteRound", fontSize: 18),
                              ),
                              FlatButton(
                                child: Text(
                                    'https://www.facebook.com/suficirclesapp',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Comfortaa')),
                                onPressed: () async {
                                  await openURI(
                                      'https://www.facebook.com/suficirclesapp');
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
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
