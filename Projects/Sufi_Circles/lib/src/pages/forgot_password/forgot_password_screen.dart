import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/services/api/AuthServices.dart';
import 'package:Sufi_Circles/src/utils/message.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppIcon.dart';
import 'package:Sufi_Circles/src/widgets/auth/AppTitle.dart';
import 'package:Sufi_Circles/src/widgets/auth/Background.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:Sufi_Circles/src/widgets/form/inputs.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthModel store = AuthModel();
  final globalKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  TextEditingController emailController = TextEditingController(text: "");

  void loader() => this.setState(() => isLoading = !isLoading);

  ScaffoldFeatureController _showSnackBar(String message, bool isError) {
    if (isError)
      return globalKey.currentState.showSnackBar(showErrorMessage(message));
    return globalKey.currentState.showSnackBar(showSuccessMessage(message));
  }

  Future sendPasswordResetEmail(BuildContext context) async {
    try {
      AuthService _authService = AuthService();
      await _authService.sendPasswordResetEmailAsync(store.email);
      this._showSnackBar("Email has been sent.", false);
    } catch (e) {
      this._showSnackBar(e.toString(), true);
    }
    store.setEmail("");
    loader();
  }

  Future validateEmail(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (store.email.isNotEmpty) {
      loader();
      sendPasswordResetEmail(context);
    } else {
      store.setEmail("");
      _showSnackBar("Please enter correct email to reset your password.", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: buildAuthBackground(),
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            AppIcon(),
            AppTitle(color: Colors.white),
            SizedBox(height: 10),
            Text(
              "Forgot Password?",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .apply(color: Colors.white),
            ),
            SizedBox(height: 10),
            Container(
              width: size.width * 0.8,
              child: Text(
                "Enter email address associated with your Sufi Circles.",
                textAlign: TextAlign.center,
              ),
            ),
            AuthInput(
              label: "Email",
              // validator: (String value)=> value.is,
              handleChange: (String value) => store.setEmail(value),
              icon: Icon(Icons.alternate_email, color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SubmitButton(
              title: "Confirm",
              onPressed: () => validateEmail(context),
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
