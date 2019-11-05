import 'package:Sufi_Circles/src/controllers/validate.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/ForgotPassword.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValidateAPIControllers _validateAPIControllers = ValidateAPIControllers();

  final AuthModel store = AuthModel();
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  bool attempLogin = false;

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  resetPassword() => passwordController.text = "";

  loader() => this.setState(() => attempLogin = !attempLogin);

  void validateLogin({Function resetPass}) async {
    _validateAPIControllers.validateLogin(context,
        load: loader, resetPass: resetPass);
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
          child: new GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: new Column(
              children: <Widget>[
                AppIcon(),
                AppTitle(color: Colors.white),
                AuthForm(
                  title: "SIGN IN",
                  onPress: this.validateLogin,
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
      ),
    );
  }
}
