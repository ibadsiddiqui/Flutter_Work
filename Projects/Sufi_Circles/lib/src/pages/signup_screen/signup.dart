import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
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

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthModel store = AuthModel();
  AuthService _firebaseAuth = new AuthService();
  ShowPopUp showPopUp = ShowPopUp();

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

  void validateCredentials() async {
    final authModelProvider = Provider.of<AuthModel>(context);
    authModelProvider.validateAll();
    if (authModelProvider.canLogin) {
      attemptSignup(authModelProvider.email, authModelProvider.password);
    } else {
      showPopUp.incorrectCredentials(context);
      authModelProvider.setPassword("");
    }
  }

  Future attemptSignup(String email, String password) async {
    try {
      FirebaseUser user = await _firebaseAuth.createUser(email, password);
      print(user);
      Provider.of<AuthModel>(context).setPassword("");
      showPopUp.showSuccessFulSignupPopUp(context);
    } on PlatformException catch (e) {
      showPopUp.showFailedSignupPopUp(e.code, e.message, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              title: "SIGN UP",
              onPressed: validateCredentials,
            ),
            BottomButton(
              title: "Already have an account? SIGN IN",
              onPressed: pushLoginScreen,
            )
          ],
        ),
      ),
    );
  }
}
