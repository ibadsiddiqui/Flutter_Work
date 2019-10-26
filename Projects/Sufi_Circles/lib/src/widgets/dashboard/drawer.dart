import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/profile_screen/profile_screen.dart';
import 'package:Sufi_Circles/src/pages/setting_screen/setting_screen.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer_item.dart';
import 'package:Sufi_Circles/src/widgets/named_circle/named_circle.dart';
import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  NamedCircle(size: "Large", title: "I"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: NamedCircle(size: "Small", title: "S"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ibad Siddiqui",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Comforta",
                        color: Color(0xFF072247)),
                  ),
                  Text(
                    "ibadsidiqui01@outloo.com",
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
                  pushProfileScreen(context, screen: ProfileScreen());
                }),
            DrawerItem(
                title: "Setting",
                leftIcon: Icon(Icons.settings),
                onPress: () {
                  Navigator.pop(context);
                  pushSettingsScreen(context, screen: SettingScreen());
                }),
            SizedBox(height: size.height * 0.5),
            DrawerItem(title: "Sign out", leftIcon: Icon(Icons.exit_to_app)),
          ],
        ),
      ),
    );
  }
}
