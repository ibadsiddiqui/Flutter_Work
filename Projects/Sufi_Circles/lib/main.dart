import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/pages/signup_screen/signup.dart';
import 'package:Sufi_Circles/src/pages/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<AuthModel>(
            builder: (_) => AuthModel(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            // If you're using navigation routes, Flutter needs a base route.
            // We're going to change this route once we're ready with
            // implementation of HomeScreen.
            // "/splash": (context) => SplashScreen(),
            '/': (context) => SplashScreen(),
            '/LoginScreen': (context) => LoginScreen(),
            '/SignUpScreen': (context) => SignUpScreen(),
          },
        ),
      );
}
