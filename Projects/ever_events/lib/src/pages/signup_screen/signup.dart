import 'package:ever_events/src/navigator/auth_navigator.dart';
import 'package:ever_events/src/widgets/auth/Buttons.dart';
import 'package:ever_events/src/widgets/auth/Inputs.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.only(top: 150),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("asset/images/Auth_BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          children: <Widget>[
            new Text("Ever Events",
                style: Theme.of(context).textTheme.headline),
            new Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: authInput(
                    label: "Username",
                    validator: (String value) {},
                    handleChange: (String value) {
                      print(value);
                    })),
            new Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: authInput(
                    label: "Email",
                    validator: (String value) {},
                    keyboardType: TextInputType.emailAddress,
                    handleChange: (String value) {
                      print(value);
                    })),
            new Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: authInput(
                  label: "Password",
                  validator: (String value) {},
                  handleChange: (String value) {},
                  obsure: true,
                )),
            const SizedBox(height: 30),
            submitButton(title: "SIGN UP"),
            Container(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () => pushLoginScreen(context),
                child: Text("Already have an account? SIGN IN",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }
}
