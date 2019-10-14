import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:Sufi_Circles/src/widgets/popup/Popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthModel store = AuthModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  void validateLogin(BuildContext context) {
    final authModelProvider = Provider.of<AuthModel>(context);
    authModelProvider.validateAll();
    if (authModelProvider.canLogin)
      ShowPopUp(context,
          type: AlertType.success,
          title: "Welcome Back",
          desc: "See all the new events happening",
          onPressed: () {},
          label: "Ok");
    else {
      ShowPopUp(context,
          type: AlertType.error,
          title: "Incorrect Details",
          label: "Try again",
          desc:
              "Your email or password is incorrect. Please enter correct details.",
          onPressed: () => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          padding: EdgeInsets.only(top: 75),
          child: new Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(),
              AuthForm(),
              const SizedBox(height: 30),
              SubmitButton(
                title: "SIGN IN",
                onPressed: () => this.validateLogin(context),
              ),
              BottomButton(
                title: "New here? SIGN UP",
                onPressed: pushSignUpScreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
