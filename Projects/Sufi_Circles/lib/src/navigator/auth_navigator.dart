import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/signup_screen/signup.dart';
import 'package:flutter/material.dart';

void pushLoginScreen(context) {
  Navigator.of(context).pushReplacementNamed("/LoginScreen");
}

void pushSignUpScreen(context) {
  Navigator.of(context).pushReplacementNamed("/SignUpScreen");
}
