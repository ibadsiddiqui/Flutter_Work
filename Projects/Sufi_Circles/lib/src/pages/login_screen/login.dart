import 'package:Sufi_Circles/src/controllers/validate.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/ForgotPassword.dart';
import 'package:Sufi_Circles/src/widgets/form/auth_form.dart';
import 'package:flutter/material.dart';

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

  void resetPassword() => passwordController.text = "";

  void loader() => this.setState(() => attempLogin = !attempLogin);

  void validateLogin({Function resetPass}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    _validateAPIControllers.validateLogin(context,
        load: loader, resetPass: resetPass);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
