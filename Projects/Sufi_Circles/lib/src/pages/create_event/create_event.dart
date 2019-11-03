import 'package:Sufi_Circles/main.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color(0xFF072247),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Create something that people remember',
                style: TextStyle(fontFamily: "Comfortaa")),
          ),
          FlatButton(
            color: Color(0xFFFC3C3C),
            onPressed: () {},
            child: Text(
              "Click here to start",
              style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
            ),
          ),
        ],
      ),
    );
  }
}
