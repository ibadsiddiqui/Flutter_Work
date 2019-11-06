import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/pages/create_event/create_event.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/profile_screen/profile_screen.dart';
import 'package:Sufi_Circles/src/pages/setting_screen/setting_screen.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer_item.dart';
import 'package:Sufi_Circles/src/widgets/named_circle/named_circle.dart';
import 'package:provider/provider.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        child: Consumer<UserModel>(
          builder: (context, data, _) {
            bool profilePicFromNetwork = data.profilePicture ==
                "asset/images/placeholder/cover/index.png";
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 20),
                  child: profilePicFromNetwork
                      ? NamedCircle(
                          size: "Large", title: getFirstChars(data.name))
                      : (data.profilePicture.isNotEmpty &&
                              !profilePicFromNetwork
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  data.profilePicture,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : NamedCircle(
                              size: "Large", title: getFirstChars(data.name))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Comforta",
                            color: Color(0xFF072247)),
                      ),
                      Text(
                        data.email,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Comforta",
                            color: Color(0xFF072247)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                DrawerItem(
                    title: "Profile",
                    leftIcon: Icon(Icons.person),
                    onPress: () {
                      Navigator.pop(context);
                      pushScreen(context, screen: ProfileScreen());
                    }),
                DrawerItem(
                    title: "Create Event",
                    leftIcon: Icon(Icons.event),
                    onPress: () {
                      Navigator.pop(context);
                      pushScreen(context, screen: CreateEvent());
                    }),
                DrawerItem(
                    title: "See All Events",
                    leftIcon: Icon(Icons.event),
                    onPress: () {
                      Navigator.pop(context);
                      pushScreen(context, screen: SettingScreen());
                    }),
                DrawerItem(
                    title: "Setting",
                    leftIcon: Icon(Icons.settings),
                    onPress: () {
                      Navigator.pop(context);
                      pushScreen(context, screen: SettingScreen());
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
