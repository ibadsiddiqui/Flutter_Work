import 'dart:core';

import 'package:Sufi_Circles/src/constants/keys.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/loading_screen/loading_screen.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/onboarding_screen/onboarding.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class OnBoardingLoadingScreen extends StatelessWidget {
  final ShareUtils utils = ShareUtils();

  Future _checkUserSession(context) async {
    String time = await utils.getStringPreference(SET_TOKEN_EXPIRY);
    if (time != null) {
      if (DateTime.now().compareTo(DateTime.parse(time)) != 0) {
        String uid = await utils.getStringPreference(SET_USER_ID);
        TimeNavigation.navigate(context, LoadingScreen(uid: uid), second: 2);
      } else
        TimeNavigation.navigate(context, LoginScreen(), second: 2);
    } else
      this._navigateToOnBoard(context);
  }

  Future _navigateToOnBoard(context) async {
    bool isInstalled = await utils.getBoolPreference(IsInstalled);
    if (isInstalled != null)
      TimeNavigation.navigate(context, LoginScreen(), second: 2);
    else {
      await utils.setBoolPreference(IsInstalled, true);
      TimeNavigation.navigate(context, OnBoardingScreen(), second: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    this._checkUserSession(context);
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
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
