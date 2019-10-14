import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
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
            SubmitButton(title: "SIGN UP"),
            BottomButton(
              onPressed: pushLoginScreen,
            )
          ],
        ),
      ),
    );
  }
}
