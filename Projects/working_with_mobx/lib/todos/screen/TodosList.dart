import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:working_with_mobx/todos/mobx/LoginStates.dart';
import 'package:working_with_mobx/todos/widgets/styledInput.dart'; // Import the Counter

final loginStates = LoginStates();

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        padding: const EdgeInsets.all(30.0),
        color: Colors.white,
        child: new Container(
          child: new Center(
            child: new Column(
              children: [
                new Padding(padding: EdgeInsets.only(top: 140.0)),
                new Text(
                  'Beautiful Flutter TextBox ${loginStates.userEmail}',
                  style: new TextStyle(
                      color: hexToColor("#F2A03D"), fontSize: 25.0),
                ),
                new Padding(padding: EdgeInsets.only(top: 50.0)),
                Observer(
                    builder: (_) => styledInput(
                        loginStates.userEmail,
                        "Enter email here",
                        loginStates.setUserEmail,
                        TextInputType.emailAddress)),
                new Padding(padding: EdgeInsets.only(top: 50.0)),
                Observer(
                  builder: (_) => styledInput(
                      loginStates.userPassword,
                      "Enter password here",
                      loginStates.setUserPassword,
                      TextInputType.visiblePassword),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
