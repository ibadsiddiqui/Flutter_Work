import 'package:ever_events/src/widgets/auth/Inputs.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("asset/images/Auth_BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Ever Events",
                style: Theme.of(context).textTheme.headline,
              ),
              new Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: authInput("Username", (String value) {}, (String value) {
                  print(value);
                }),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: authInput("Email", (String value) {}, (String value) {
                  print(value);
                }),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: authInput("Password", (String value) {}, (String value) {
                  print(value);
                }),
              ),
              const SizedBox(height: 30),
              new RaisedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    SizedBox(width: 100.0),
                    Text("SIGN UP",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    SizedBox(width: 100.0),
                  ],
                ),
                textColor: Colors.white,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.pinkAccent,
                splashColor: Colors.pink,
                shape: const StadiumBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
