import 'dart:async';

import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:flutter/material.dart';

class TimeNavigation {
  static void navigate(context, Widget screen) {
    new Timer(
        Duration(seconds: 5),
        () =>
            Navigator.pushReplacement(context, createRoute(screen: screen)));
  }
}
