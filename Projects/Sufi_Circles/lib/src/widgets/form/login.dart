import 'package:Sufi_Circles/src/models/auth/AuthFormModel.dart';
import 'package:Sufi_Circles/src/widgets/form/inputs.dart';
import 'package:Sufi_Circles/src/widgets/auth/SubmitButton.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function onPress;
  final bool isLoading;
  final String title;
  const LoginForm({Key key, this.onPress, this.isLoading, this.title})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  final AuthModel store = AuthModel();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  resetPassword() => passwordController.text = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          AuthInput(
            label: "Email",
            //TODO: Add validation
            // validator: (String value)=> value.is,
            handleChange: (String value) => store.setEmail(value),
            icon: Icon(Icons.alternate_email, color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          AuthInput(
            label: "Password",
            controller: passwordController,
            // validator: (String value) {},
            obscure: true,
            handleChange: (String value) => store.setPassword(value),
            icon: Icon(
              Icons.lock_open,
              color: Colors.white,
            ),
          ),
          SubmitButton(
            title: widget.title,
            onPressed: () {
              store.validateAll();
              widget.onPress(context, resetPassword, store);
            },
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
