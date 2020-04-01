import 'dart:core';
import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:flutter/material.dart';

import 'package:Sufi_Circles/src/constants/keys.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/onboarding_screen/onboarding.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';

class OnBoardingLoadingScreen extends StatefulWidget {
  final NavigationType newRoute;

  const OnBoardingLoadingScreen({Key key, this.newRoute}) : super(key: key);
  @override
  _OnBoardingLoadingScreenState createState() =>
      _OnBoardingLoadingScreenState();
}

class _OnBoardingLoadingScreenState extends State<OnBoardingLoadingScreen> {
  ShareUtils utils = ShareUtils();
  NavigationType currentRoute = NavigationType.Loading;

  @override
  void initState() {
    super.initState();
    if (widget.newRoute != null)
      this.setState(() => currentRoute = widget.newRoute);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._checkUserSession(context);
  }

  @override
  void dispose() => super.dispose();

  Future<void> _getUserDetails(context, String uid) async {
    if (uid != null) {
      this.setState(() => currentRoute = NavigationType.ToDashboard);
      UserDBController userDB = UserDBController();
      bool doesUser = await userDB.setUserDetailsUsingID(context, uid);
      if (doesUser)
        return timeNavigation(context, DashboardScreen(), second: 3);
    }

    return timeNavigation(context, LoginScreen());
  }

  Future _checkUserSession(context) async {
    String time = await utils.getStringPreference(SET_TOKEN_EXPIRY);
    if (time != null) {
      if (DateTime.now().compareTo(DateTime.parse(time)) != 0) {
        String uid = await utils.getStringPreference(SET_USER_ID);
        return this._getUserDetails(context, uid);
      } else
        return timeNavigation(context, LoginScreen(), second: 2);
    } else
      return this._navigateToOnBoard(context);
  }

  Future _navigateToOnBoard(context) async {
    bool isInstalled = await utils.getBoolPreference(IsInstalled);
    if (isInstalled != null)
      return timeNavigation(context, LoginScreen(), second: 2);
    else {
      await utils.setBoolPreference(IsInstalled, true);
      return timeNavigation(context, OnBoardingScreen(), second: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    String message = "Loading all the good things happening around...";
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Loader(
                dotOneColor: Colors.redAccent,
                dotTwoColor: Colors.blueAccent,
                dotThreeColor: Colors.greenAccent,
                dotType: DotType.circle,
                dotIcon: Icon(Icons.adjust),
                duration: Duration(milliseconds: 1000),
              ),
              SizedBox(height: 10),
              Text(
                currentRoute == NavigationType.Loading ? "" : message,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
