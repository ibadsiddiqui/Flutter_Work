import 'package:Sufi_Circles/src/widgets/auth/AuthInput.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        AuthInput(
          label: "Email",
          validator: (String value) {},
          handleChange: (String value) =>
              Provider.of<AuthModel>(context, listen: false).setEmail(value),
          icon: Icon(Icons.alternate_email, color: Colors.white),
          keyboardType: TextInputType.emailAddress,
        ),
        AuthInput(
          label: "Password",
          validator: (String value) {},
          obscure: true,
          handleChange: (String value) =>
              Provider.of<AuthModel>(context, listen: false).setPassword(value),
          icon: Icon(
            Icons.lock_open,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
