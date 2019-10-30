import 'package:flutter/material.dart';
import 'dart:core';

import 'package:Sufi_Circles/src/constants/keys.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/onboarding_screen/onboarding.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';

class OnBoardingLoadingScreen extends StatefulWidget {
  @override
  _OnBoardingLoadingScreenState createState() =>
      new _OnBoardingLoadingScreenState();
}

class _OnBoardingLoadingScreenState extends State<OnBoardingLoadingScreen> {
  ShareUtils utils = ShareUtils();

  @protected
  @mustCallSuper
  Future didChangeDependencies() async => checkUserSession();

  void checkUserSession() async {
    try {
      String time = await utils.getStringPreference(SET_TOKEN_EXPIRY);
      if (time != null) {
        if (DateTime.now().compareTo(DateTime.parse(time)) != 0) {
          TimeNavigation.navigate(context, DashboardScreen());
        } else
          TimeNavigation.navigate(context, LoginScreen());
      } else
        navigateToOnBoard();
    } catch (e) {}
  }

  void navigateToOnBoard() async {
    Future<bool> isInstalled = utils.getBoolPreference(IsInstalled);
    if (isInstalled != null)
      TimeNavigation.navigate(context, LoginScreen());
    else {
      utils.setBoolPreference(IsInstalled, true);
      TimeNavigation.navigate(context, OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(8, 51, 88, 1),
        child: Center(
          child: Loader(
            dotOneColor: Colors.redAccent,
            dotTwoColor: Colors.blueAccent,
            dotThreeColor: Colors.greenAccent,
            dotType: DotType.circle,
            dotIcon: Icon(Icons.adjust),
            duration: Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}
