import 'package:ever_events/src/screens/login_screen/login.dart';
import 'package:ever_events/src/screens/signup_screen/signup.dart';
import 'package:flutter/material.dart';

void pushLoginScreen(context) {
  Navigator.push(context, MaterialPageRoute<void>(
    builder: (BuildContext conext) {
      return LoginScreen();
    },
  ));
}

void pushSignUpScreen(context) {
  Navigator.push(context, MaterialPageRoute<void>(
    builder: (BuildContext conext) {
      return SignUpScreen();
    },
  ));
}
