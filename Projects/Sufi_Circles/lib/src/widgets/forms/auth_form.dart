import 'package:Sufi_Circles/src/widgets/auth/AuthInput.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthForm extends StatelessWidget {
  final emailController;
  final passwordController;
  final Function onPress;
  final bool isLoading;
  final String title;
  const AuthForm(
      {Key key,
      this.emailController,
      this.passwordController,
      this.onPress,
      this.isLoading,
      this.title})
      : super(key: key);

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
          title: title,
          onPressed: onPress,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
