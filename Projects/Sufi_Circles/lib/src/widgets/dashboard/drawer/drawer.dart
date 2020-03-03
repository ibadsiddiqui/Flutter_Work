import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/create_event/create_event.dart';
import 'package:Sufi_Circles/src/pages/profile_screen/profile_screen.dart';
import 'package:Sufi_Circles/src/pages/setting_screen/setting_screen.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/circles/named_circle.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/circles/profile_image.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardDrawer extends StatelessWidget {
  void _navigateTo(context, {Widget screen}) {
    Navigator.pop(context);
    pushScreen(context, screen: screen);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        child: Consumer<UserModel>(
          builder: (context, data, _) {
            bool isProfilePic = isPicPlaceholder(data.profilePicture);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 20),
                  child: isProfilePic
                      ? NamedCircle(title: getFirstChars(data.name))
                      : (data.profilePicture.isNotEmpty && !isProfilePic
                          ? RoundProfileImage(image: data.profilePicture)
                          : NamedCircle(title: getFirstChars(data.name))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.name,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Text(
                        data.email,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .apply(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                DrawerItem(
                  title: "Profile",
                  leftIcon: Icon(Icons.person),
                  onPress: () => _navigateTo(context, screen: ProfileScreen()),
                ),
                DrawerItem(
                  title: "Create Event",
                  leftIcon: Icon(Icons.event),
                  onPress: () => _navigateTo(context, screen: CreateEvent()),
                ),
                DrawerItem(
                  title: "See All Events",
                  leftIcon: Icon(Icons.event),
                  onPress: () => _navigateTo(context, screen: SettingScreen()),
                ),
                DrawerItem(
                  title: "Setting",
                  leftIcon: Icon(Icons.settings),
                  onPress: () => _navigateTo(context, screen: SettingScreen()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
