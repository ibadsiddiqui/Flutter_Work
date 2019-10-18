import 'package:flutter/material.dart';

void pushLoginScreen(context) {
  Navigator.of(context).pushReplacementNamed("/LoginScreen");
}

void pushSignUpScreen(context) {
  Navigator.of(context).pushReplacementNamed("/SignUpScreen");
}
