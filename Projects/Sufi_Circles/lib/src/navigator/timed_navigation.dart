import 'dart:async';
import 'package:flutter/material.dart';

import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';

void timeNavigation(context, Widget screen, {second = 6}) {
  new Timer(Duration(seconds: second),
      () => Navigator.pushReplacement(context, createRoute(screen: screen)));
}
