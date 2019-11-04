import 'package:Sufi_Circles/src/widgets/add_event_details/form/multiline_input.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';

class EventDetailForm extends StatelessWidget {
  final Function onFieldSubmit;
  final TextEditingController controller;
  final String hint;
  final String title;
  const EventDetailForm(
      {Key key, this.onFieldSubmit, this.controller, this.hint, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22.0,
              color: Color(0xFF072247),
              fontFamily: "CreteRound",
              fontWeight: FontWeight.bold,
            ),
          ),
          MultiLineInput(
            maxLines: 2,
            minLines: 1,
            maxLength: 10,
            hintText: hint,
            controller: controller,
            onFieldSubmit: onFieldSubmit,
          ),
          RoundClippedButton(isMain: false, onPress: () {}),
        ],
      ),
    );
  }
}
