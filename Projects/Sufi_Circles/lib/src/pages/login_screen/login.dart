import 'package:Sufi_Circles/src/controllers/validate.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/auth/ForgotPassword.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/forms/auth_form.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool attempLogin = false;
  final AuthModel store = AuthModel();

  ValidateAPIControllers _validateAPIControllers = ValidateAPIControllers();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  resetPassword() => widget.passwordController.text = "";

  loader() => this.setState(() => attempLogin = !attempLogin);

  void validateLogin() async {
    _validateAPIControllers.validateLogin(context,
        load: loader, resetPass: resetPassword);
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
            onTap: () => FocusScope.of(context).unfocus(),
            child: new Column(
              children: <Widget>[
                AppIcon(),
                AppTitle(color: Colors.white),
                AuthForm(
                  passwordController: widget.passwordController,
                  emailController: widget.emailController,
                ),
                const SizedBox(height: 30),
                SubmitButton(
                  title: "SIGN IN",
                  onPressed: this.validateLogin,
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
