import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/signup_screen/signup.dart';
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