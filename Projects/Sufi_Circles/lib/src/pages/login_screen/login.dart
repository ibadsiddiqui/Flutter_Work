import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        body: new Container(
          padding: EdgeInsets.only(top: 75),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("asset/images/Auth_BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(),
              AuthForm(),
              const SizedBox(height: 30),
              SubmitButton(title: "SIGN IN"),
              BottomButton(
                onPressed: pushSignUpScreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
