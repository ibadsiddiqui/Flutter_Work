import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/pages/onboarding_screen/onboarding.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/setting_screen/setting_screen.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class OnBoardingLoadingScreen extends StatefulWidget {
  @override
  _OnBoardingLoadingScreenState createState(  ) =>
      new _OnBoardingLoadingScreenState();
}

class _OnBoardingLoadingScreenState extends State<OnBoardingLoadingScreen> {
  @override
  void initState() {
    super.initState();
    TimeNavigation.navigate(context, SettingScreen());
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
