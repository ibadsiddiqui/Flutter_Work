import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/signup_screen/signup.dart';
import 'package:Sufi_Circles/src/pages/splash_screen/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(EverEventsApp());

class EverEventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        // "/splash": (context) => SplashScreen(),
        '/': (context) => SplashScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
        '/LoginScreen': (context) => LoginScreen(),
      },
    );
  }
}