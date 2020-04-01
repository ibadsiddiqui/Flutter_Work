import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/utils/message.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/form/signup.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController _authController = AuthController();
  final globalKey = GlobalKey<ScaffoldState>();

  ScaffoldFeatureController buildSnackMessage(
      context, String msg, bool isError) {
    if (isError)
      return globalKey.currentState.showSnackBar(
          showErrorMessage("Please enter same passwords to proceed."));
    return globalKey.currentState.showSnackBar(showSuccessMessage(
        "You have successfully been registered. You can sign in now."));
  }

  Future attemptSignup(context, resetPassword, loader) async {
    AuthModel authModel = Provider.of<AuthModel>(context);
    authModel.validateAll();
    if (authModel.canLogin) {
      if (authModel.doesPasswordMatch()) {
        FocusScope.of(context).requestFocus(FocusNode());
        _authController.userSignup(context, loader, resetPassword);
      } else {
        String message = "Please enter same passwords to proceed.";
        this.buildSnackMessage(context, message, true);
      }
    } else {
      String message = "Invalid email. Please enter details to proceed.";
      this.buildSnackMessage(context, message, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          decoration: buildAuthBackground(),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(color: Colors.white),
              SignUpForm(title: "SIGN UP", onPress: attemptSignup),
              Expanded(child: Divider()),
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
