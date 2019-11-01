import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/profile_screen/profile_screen.dart';
import 'package:Sufi_Circles/src/pages/setting_screen/setting_screen.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer_item.dart';
import 'package:Sufi_Circles/src/widgets/named_circle/named_circle.dart';

class DashboardDrawer extends StatelessWidget {
  final String name;
  final String email;

  const DashboardDrawer({Key key, this.name, this.email}) : super(key: key);

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
                  NamedCircle(size: "Large", title: ""),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: NamedCircle(size: "Small", title: ""),
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
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Comforta",
                        color: Color(0xFF072247)),
                  ),
                  Text(
                    email,
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
                title: "See All Events",
                leftIcon: Icon(Icons.event),
                onPress: () {
                  Navigator.pop(context);
                  pushSettingsScreen(context, screen: SettingScreen());
                }),
            DrawerItem(
                title: "Setting",
                leftIcon: Icon(Icons.settings),
                onPress: () {
                  Navigator.pop(context);
                  pushSettingsScreen(context, screen: SettingScreen());
                }),
            SizedBox(height: size.height * 0.45),
            DrawerItem(title: "Sign out", leftIcon: Icon(Icons.exit_to_app)),
          ],
        ),
      ),
    );
  }
}
