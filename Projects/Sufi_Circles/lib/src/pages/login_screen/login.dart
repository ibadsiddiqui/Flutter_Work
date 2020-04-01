import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/forgot_password/forgot_password_screen.dart';
import 'package:Sufi_Circles/src/utils/message.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/BottomButton.dart';
import 'package:Sufi_Circles/src/widgets/form/login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool attempLogin = false;
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  void loader() => this.setState(() => attempLogin = !attempLogin);

  Future validateLogin(context, Function resetPass, AuthModel store) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (store.canLogin) {
      this.loader();
      AuthController _authController = AuthController();
      await _authController.userSignIn(context, store, loader, resetPass);
    } else {
      resetPass();
      store.setPassword("");
      return globalKey.currentState.showSnackBar(showErrorMessage(
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
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: FlatButton(
                    padding: EdgeInsets.all(20.0),
                    onPressed: () =>
                        pushScreen(context, screen: ForgotPasswordScreen()),
                    child: Text("Forgot your password?",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .apply(fontFamily: "Comfortta")),
                  ),
                ),
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
