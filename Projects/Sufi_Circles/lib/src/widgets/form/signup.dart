import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/widgets/form/inputs.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  final Function onPress;
  final bool isLoading;
  final String title;
  const SignUpForm({Key key, this.onPress, this.isLoading, this.title})
      : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  resetPassword() => passwordController.text = "";

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
        SubmitButton(
          title: widget.title,
          onPressed: () => widget.onPress(resetPass: resetPassword),
          isLoading: widget.isLoading,
        ),
      ],
    );
  }
}
