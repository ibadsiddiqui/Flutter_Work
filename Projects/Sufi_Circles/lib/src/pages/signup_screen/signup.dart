import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/controllers/validate.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/form/auth_form.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  bool attemptSignup = false;
  final AuthModel store = AuthModel();

  ValidateAPIControllers _validateAPIControllers = new ValidateAPIControllers();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  resetPassword() => passwordController.text = "";

  loader() => this.setState(() => attemptSignup = !attemptSignup);

  Future validateSignup({Function resetPass}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    _validateAPIControllers.validateSignup(context,
        resetPass: resetPassword, load: loader);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
          padding: EdgeInsets.only(top: size.height * 0.075),
          decoration: buildAuthBackground(),
          height: MediaQuery.of(context).size.height,
          child:  Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(color: Colors.white),
              AuthForm(
                title: "SIGN UP",
                onPress: validateSignup,
                isLoading: attemptSignup,
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
