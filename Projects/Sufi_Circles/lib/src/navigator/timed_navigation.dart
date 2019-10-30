import 'dart:async';
import 'package:flutter/material.dart';

import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';

class TimeNavigation {
  static void navigate(context, Widget screen) {
    new Timer(
        Duration(seconds: 6),
        () =>
            Navigator.pushReplacement(context, createRoute(screen: screen)));
  }
}
