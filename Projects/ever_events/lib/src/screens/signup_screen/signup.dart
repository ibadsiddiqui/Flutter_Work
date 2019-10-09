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
            new RaisedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  SizedBox(width: 100.0, height: 57.5),
                  Text("SIGN UP",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  SizedBox(width: 100.0, height: 57.5),
                ],
              ),
              textColor: Colors.white,
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.pinkAccent,
              splashColor: Colors.pink,
              shape: const StadiumBorder(),
            ),
            Container(
              height: 220.0,
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed("/LoginScreen"),
                child: Text(
                  "Already have an account? SIGN IN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
