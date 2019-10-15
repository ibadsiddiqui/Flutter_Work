import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/services/AuthServices.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:Sufi_Circles/src/widgets/popup/AuthPopups.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthModel store = AuthModel();
  final ShowPopUp showPopUp = ShowPopUp();
  AuthService _firebaseAuth = new AuthService();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  void validateLogin(BuildContext context) async {
    final authModelProvider = Provider.of<AuthModel>(context);
    authModelProvider.validateAll();
    if (authModelProvider.canLogin) {
      attemptLogin(authModelProvider.email, authModelProvider.password);
    } else
      showPopUp.incorrectCredentials(context);
  }

  void attemptLogin(String email, String password) async {
    try {
      var _user = await _firebaseAuth.signIn(email, password);
      IdTokenResult userToken = await _user.getIdToken();
      showPopUp.showSuccessFulSigninPopUp(context);
    } on PlatformException catch (e) {
      print(e);
      showPopUp.incorrectCredentials(context);
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
