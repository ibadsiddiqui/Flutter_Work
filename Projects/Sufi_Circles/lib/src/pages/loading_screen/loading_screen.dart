import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String uid;

  final UserDBController _userDBController = UserDBController();

  LoadingScreen({Key key, this.uid = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this._getUserDetails(context);
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Loader(),
            SizedBox(height: 10),
            Text(
              "Loading all the good things happening around...",
              style: TextStyle(
                color: Colors.white,
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getUserDetails(BuildContext context) async {
    if (uid.isNotEmpty) {
      bool doesUser =
          await _userDBController.setUserDetailsUsingID(context, uid);
      if (doesUser)
        return timeNavigation(context, DashboardScreen(), second: 4);
    }
    return timeNavigation(context, LoginScreen(), second: 3);
  }
}
