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
                Provider.of<AuthModel>(context, listen: false).setEmail(value)),
        AuthInput(
            label: "Password",
            validator: (String value) {},
            obsure: true,
            handleChange: (String value) =>
                Provider.of<AuthModel>(context, listen: false)
                    .setPassword(value)),
      ],
    );
  }
}
