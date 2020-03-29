import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/widgets/form/inputs.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  final Function onPress;
  final String title;

  SignUpForm({Key key, this.onPress, this.title}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "");
  bool attemptSignup = false;

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  loader() => this.setState(() => attemptSignup = !attemptSignup);

  resetPassword() {
    final authProvider = Provider.of<AuthModel>(context);
    authProvider.setPassword("");
    authProvider.setConfirmPassword("");
    confirmPasswordController.text = "";
    passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthModel>(context);
    return new Column(
      children: <Widget>[
        AuthInput(
          label: "Email",
          // TODO: add correct validation
          // validator: (String value) {},
          handleChange: (String value) => authProvider.setEmail(value),
          icon: Icon(Icons.alternate_email, color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        AuthInput(
          label: "Password",
          controller: passwordController,
          // validator: (String value) {},
          obscure: true,
          handleChange: (String value) => authProvider.setPassword(value),
          icon: Icon(
            Icons.lock_open,
            color: Colors.white,
          ),
        ),
        AuthInput(
          label: "Confirm Password",
          controller: confirmPasswordController,
          // validator: (String value) {},
          obscure: true,
          handleChange: authProvider.setConfirmPassword,
          icon: Icon(Icons.lock_open, color: Colors.white),
        ),
        SubmitButton(
          title: widget.title,
          onPressed: () => widget.onPress(context, resetPassword, loader),
          isLoading: attemptSignup,
        ),
      ],
    );
  }
}
