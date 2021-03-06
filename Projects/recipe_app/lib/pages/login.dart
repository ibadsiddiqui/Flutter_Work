import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/widgets/GoogleSignInButton/google_sign_in_button.dart';
import 'package:recipe_app/widgets/backgroundImage/BackgroundImage.dart';
import 'package:recipe_app/widgets/heading/HeadingWidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  /*
    * Todo:
    * Implement Google sign in
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        // We do not use backgroundColor property anymore.
        // New Container widget wraps our Center widget:
        decoration: buildBackground("assets/brooke-lark-385507-unsplash.jpg"),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildText("Recipes", context),
              // Space between "Recipes" and the button:
              SizedBox(height: 50.0),
              GoogleSignInButton(
                onPressed: () =>
                    // StateWidget.of(context).signInWithGoogle(),
                    Navigator.of(context).pushReplacementNamed('/'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
