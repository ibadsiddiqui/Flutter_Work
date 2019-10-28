import 'package:Sufi_Circles/src/widgets/auth/AuthInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (_, data, __) => new Column(
        children: <Widget>[
          Observer(
            builder: (_) => AuthInput(
              label: "Email",
              validator: (String value) {},
              handleChange: (String value) =>
                  Provider.of<AuthModel>(context).setEmail(value),
              icon: Icon(Icons.alternate_email, color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              initialValue: data.email,
            ),
          ),
          Observer(
            builder: (_) => AuthInput(
              label: "Password",
              initialValue: data.password,
              validator: (String value) {},
              obscure: true,
              handleChange: (String value) =>
                  Provider.of<AuthModel>(context).setPassword(value),
              icon: Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
