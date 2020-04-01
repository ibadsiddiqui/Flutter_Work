import 'package:Sufi_Circles/src/controllers/api/AuthController.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
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
  bool isLoading = false;
  TextEditingController emailController = TextEditingController(text: "");
  final AuthModel store = AuthModel();
  final globalKey = GlobalKey<ScaffoldState>();

  void loader() => this.setState(() => isLoading = !isLoading);

  Future validateEmail(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (store.email.isNotEmpty) {
      this.loader();
      AuthController _authController = AuthController();
      // await _authController.userSignIn(context, store, loader);
    } else {
      // resetPass();
      store.setEmail("");
      // context.
      return globalKey.currentState.showSnackBar(showErrorMessage(
          "Please enter correct email to reset your password."));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      resizeToAvoidBottomInset: false,
      body: new Container(
        padding: EdgeInsets.only(top: size.height * 0.075),
        width: size.width,
        height: size.height,
        decoration: buildAuthBackground(),
        child: new GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: Column(
            children: <Widget>[
              AppIcon(),
              AppTitle(color: Colors.white),
              SizedBox(height: 20),
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
      ),
    );
  }
}
