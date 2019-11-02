import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
// import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/pages/onboard_loading_screen/onboarding_loading.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ShareUtils shareUtils = ShareUtils();
  @override
  void initState() {
    super.initState();
    // shareUtils.clearAll();
    TimeNavigation.navigate(context, OnBoardingLoadingScreen());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    "asset/icons/app icon/app_icon.png",
                    fit: BoxFit.fill,
                  ),
                ),
                AppTitle(color: Color.fromRGBO(8, 51, 88, 1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
