import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/add_event_details/add_details.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF072247)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Create something that people remember',
                style: TextStyle(fontFamily: "Comfortaa")),
          ),
          RoundClippedButton(
            title: "Start",
            onPress: () => pushScreen(context, screen: AddEventDetails()),
          )
        ],
      ),
    );
  }
}
