import 'package:Sufi_Circles/src/pages/loading_screen/loading_screen.dart';
import 'package:flutter/material.dart';

Route createRoute({Widget screen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin = Offset(1.0, 0.0);
      Offset end = Offset.zero;
      Cubic curve = Curves.ease;

      Animatable tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

void pushLoginScreen(context) {
  Navigator.of(context).pushReplacementNamed("/LoginScreen");
}

void pushSignUpScreen(context) {
  Navigator.of(context).pushReplacementNamed("/SignUpScreen");
}

void pushScreen(context, {Widget screen}) {
  Navigator.push(context, createRoute(screen: screen));
}

void startRouteWihLoading(context, uid) {
  Navigator.push(context, createRoute(screen: LoadingScreen(uid: uid)));
}