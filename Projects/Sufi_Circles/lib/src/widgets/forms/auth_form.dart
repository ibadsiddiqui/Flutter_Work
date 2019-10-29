import 'package:Sufi_Circles/src/widgets/auth/AuthInput.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthForm extends StatefulWidget {
  final Function onPress;
  final bool isLoading;
  final String title;
  const AuthForm(
      {Key key,
      this.onPress,
      this.isLoading,
      this.title})
      : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  resetPassword() => passwordController.text = "";

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthModel>(context);
    return new Column(
      children: <Widget>[
        AuthInput(
          label: "Email",
          validator: (String value) {},
          handleChange: (String value) => authProvider.setEmail(value),
          icon: Icon(Icons.alternate_email, color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        AuthInput(
          label: "Password",
          controller: passwordController,
          validator: (String value) {},
          obscure: true,
          handleChange: (String value) => authProvider.setPassword(value),
          icon: Icon(
            Icons.lock_open,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        SubmitButton(
          title: widget.title,
          onPressed: () => widget.onPress(resetPass: resetPassword),
          isLoading: widget.isLoading,
        ),
      ],
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
