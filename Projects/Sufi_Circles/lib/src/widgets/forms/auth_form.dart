import 'package:Sufi_Circles/src/widgets/auth/AuthInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthForm extends StatelessWidget {
  final emailController;
  final passwordController;

  const AuthForm({Key key, this.emailController, this.passwordController})
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
      ],
    );
  }
}
