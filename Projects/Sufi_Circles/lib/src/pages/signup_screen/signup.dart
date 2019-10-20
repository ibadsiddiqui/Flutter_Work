import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/services/AuthServices.dart';
import 'package:Sufi_Circles/src/services/UserServices.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
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
  UserServices userServices = UserServices();

  ShowPopUp showPopUp = ShowPopUp();

  bool attempLogin = false;

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

  toggleLoader() => this.setState(() => attempLogin = !attempLogin);

  void validateCredentials() async {
    final authModelProvider = Provider.of<AuthModel>(context);
    authModelProvider.validateAll();
    if (authModelProvider.canLogin) {
      toggleLoader();
      attemptSignup(authModelProvider.authDetails);
    } else {
      showPopUp.incorrectCredentials(context);
      authModelProvider.setPassword("");
    }
  }

  Future attemptSignup(Map<String, String> authDetails) async {
    try {
      FirebaseUser user = await _firebaseAuth.createUser(authDetails);
      print(user);
      userServices.createUserInDB({
        "uid": user.uid,
        "email": user.email,
        "isEmailVerified": user.isEmailVerified,
        "creationTimeStamp": user.metadata.creationTime,
      });
      toggleLoader();
      showPopUp.showSuccessFulSignupPopUp(context);
    } on PlatformException catch (e) {
      toggleLoader();
      showPopUp.showFailedSignupPopUp(e.code, e.message, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          padding: EdgeInsets.only(top: 75),
          decoration: buildAuthBackground(),
          height: MediaQuery.of(context).size.height,
          child: new Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(color: Colors.white),
              Consumer<AuthModel>(
                  builder: (context, data, child) => AuthForm()),
              const SizedBox(height: 30),
              SubmitButton(
                title: "SIGN UP",
                onPressed: validateCredentials,
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
