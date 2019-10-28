import 'package:Sufi_Circles/src/constants/keys.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/onboarding_screen/onboarding.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class OnBoardingLoadingScreen extends StatefulWidget {
  @override
  _OnBoardingLoadingScreenState createState() =>
      new _OnBoardingLoadingScreenState();
}

class _OnBoardingLoadingScreenState extends State<OnBoardingLoadingScreen> {
  ShareUtils utils = ShareUtils();

  @protected
  @mustCallSuper
  Future didChangeDependencies() async => navigate();

  void navigate() async {
    try {
      bool isAppInstalled = await utils.getBoolPreference("isInstalled");
      if (isAppInstalled != null && isAppInstalled == true)
        TimeNavigation.navigate(context, LoginScreen());
      else {
        utils.setBoolPreference("isInstalled", true);
        TimeNavigation.navigate(context, OnBoardingScreen());
      }
    } on NoSuchMethodError catch (e) {
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
