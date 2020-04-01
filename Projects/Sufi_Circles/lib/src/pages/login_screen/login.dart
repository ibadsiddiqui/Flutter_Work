import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/utils/message.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/ForgotPassword.dart';
import 'package:Sufi_Circles/src/widgets/form/login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController _authController = AuthController();
  bool attempLogin = false;

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  void loader() => this.setState(() => attempLogin = !attempLogin);

  Future validateLogin(context, Function resetPass, AuthModel store) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (store.canLogin) {
      this.loader();
      await _authController.userSignIn(context, store, loader, resetPass);
    } else {
      resetPass();
      store.setPassword("");
      return Scaffold.of(context).showSnackBar(showErrorMessage(
          "Please enter correct email and password to login."));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          decoration: buildAuthBackground(),
          padding: EdgeInsets.only(top: size.height * 0.075),
          height: size.height,
          child: new GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: Column(
              children: <Widget>[
                AppIcon(),
                AppTitle(color: Colors.white),
                LoginForm(
                  title: "SIGN IN",
                  onPress: this.validateLogin,
                  isLoading: attempLogin,
                ),
                ForgotPasswordButton(),
                Expanded(child: Divider()),
                BottomButton(
                  title: "Don't have an account? Create One",
                  onPressed: pushSignUpScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
