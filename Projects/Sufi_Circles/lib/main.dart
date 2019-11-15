import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/models/events_list/EventsListModel.dart';
import 'package:Sufi_Circles/src/models/recommended_events/RecommendedEventsModel.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/pages/loading_screen/loading_screen.dart';
import 'package:Sufi_Circles/src/pages/onboard_loading_screen/onboarding_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/auth/AuthFormModel.dart';
import 'src/pages/login_screen/login.dart';
import 'src/pages/onboarding_screen/onboarding.dart';
import 'src/pages/signup_screen/signup.dart';
import 'src/pages/splash_screen/splash.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthModel>(builder: (_) => AuthModel()),
        Provider<EventModel>(builder: (_) => EventModel()),
        Provider<RecommendedEventsModel>(
            builder: (_) => RecommendedEventsModel()),
        Provider<EventsListModel>(builder: (_) => EventsListModel()),
        Provider<UserModel>(builder: (_) => UserModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          // If you're using navigation routes, Flutter needs a base route.
          // We're going to change this route once we're ready with
          // implementation of HomeScreen.
          '/': (_) => SplashScreen(),
          '/OnBoardingLoadingScreen': (_) => OnBoardingLoadingScreen(),
          '/OnBoardingScreen': (_) => OnBoardingScreen(),
          '/LoginScreen': (_) => LoginScreen(),
          '/SignUpScreen': (_) => SignUpScreen(),
          '/LoadingScreen': (_) => LoadingScreen(),
          '/DashboardScreen': (_) => DashboardScreen(),
        },
      ),
    );
  }
}
