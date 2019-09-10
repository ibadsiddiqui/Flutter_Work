import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home.dart';
import 'package:recipe_app/pages/login.dart';
import 'package:recipe_app/ui/theme.dart';

void main() => runApp(RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      theme: buildTheme(),
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
