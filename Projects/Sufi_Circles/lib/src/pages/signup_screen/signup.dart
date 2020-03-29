import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/controllers/validate.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/form/signup.dart';

class SignUpScreen extends StatelessWidget {
  final ValidateAPIControllers _validateAPI = new ValidateAPIControllers();

  Future validateSignup(context, resetPassword, loader) async {
    FocusScope.of(context).requestFocus(FocusNode());
    _validateAPI.validateSignup(context, resetPassword, loader);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          padding: EdgeInsets.only(top: size.height * 0.075),
          decoration: buildAuthBackground(),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(color: Colors.white),
              SignUpForm(
                title: "SIGN UP",
                onPress: validateSignup,
              ),
              new Expanded(child: Divider()),
              BottomButton(
                title: "Already have an account? SIGN IN",
                onPressed: pushLoginScreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
