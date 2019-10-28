import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/controllers/AuthController.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/ForgotPassword.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:Sufi_Circles/src/widgets/popup/AuthPopups.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController _authController = AuthController();

  final AuthModel store = AuthModel();
  final ShowPopUp showPopUp = ShowPopUp();

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

  void validateLogin(BuildContext context) async {
    final authModelProvider = Provider.of<AuthModel>(context);
    authModelProvider.validateAll();
    if (authModelProvider.canLogin) {
      toggleLoader();
      await _authController.userSignIn(context, toggleLoader: toggleLoader);
    } else {
      showPopUp.incorrectCredentials(context);
      authModelProvider.setPassword("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          decoration: buildAuthBackground(),
          padding: EdgeInsets.only(top: 75),
          height: MediaQuery.of(context).size.height,
          child: new Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(color: Colors.white),
              Consumer<AuthModel>(
                  builder: (context, data, child) => AuthForm()),
              const SizedBox(height: 30),
              SubmitButton(
                title: "SIGN IN",
                onPressed: () => this.validateLogin(context),
                isLoading: attempLogin,
              ),
              ForgotPasswordButton(),
              new Expanded(child: Divider()),
              BottomButton(
                title: "Don't have an account? Create One",
                onPressed: pushSignUpScreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
