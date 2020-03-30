import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/onboard_loading_screen/onboarding_loading.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeNavigation(context, OnBoardingLoadingScreen(), second: 4);
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
                    "asset/icons/app_icons/app_icon.png",
                    fit: BoxFit.fill,
                  ),
                ),
                AppTitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
