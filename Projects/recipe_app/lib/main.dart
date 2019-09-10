import 'package:flutter/material.dart';
import 'package:recipe_app/pages/login.dart';

void main() => runApp(RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
