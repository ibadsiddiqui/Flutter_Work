import 'package:Sufi_Circles/src/models/events_list/EventsListModel.dart';
import 'package:Sufi_Circles/src/models/recommended_events/RecommendedEventsModel.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'src/models/auth/AuthFormModel.dart';

import 'src/pages/splash_screen/splash.dart';
import 'package:Sufi_Circles/src/pages/onboard_loading_screen/onboarding_loading.dart';
import 'src/pages/onboarding_screen/onboarding.dart';
import 'src/pages/login_screen/login.dart';
import 'src/pages/signup_screen/signup.dart';
import 'package:Sufi_Circles/src/pages/loading_screen/loading_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        Provider<AuthModel>(
          builder: (_) => AuthModel(),
        ),
        Provider<RecommendedEventsModel>(
          builder: (_) => RecommendedEventsModel(),
        ),
        Provider<EventsListModel>(
          builder: (_) => EventsListModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          // If you're using navigation routes, Flutter needs a base route.
          // We're going to change this route once we're ready with
          // implementation of HomeScreen.
          '/': (context) => SplashScreen(),
          '/OnBoardingLoadingScreen': (context) => OnBoardingLoadingScreen(),
          '/OnBoardingScreen': (context) => OnBoardingScreen(),
          '/LoginScreen': (context) => LoginScreen(),
          '/SignUpScreen': (context) => SignUpScreen(),
          '/LoadingScreen': (context) => LoadingScreen(),
          '/DashboardScreen': (context) => DashboardScreen(),
        },
      ),
    );
  }
}
