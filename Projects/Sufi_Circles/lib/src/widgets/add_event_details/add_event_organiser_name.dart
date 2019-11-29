import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';

class AddEventOrganiserName extends StatefulWidget {
  final String title;

  const AddEventOrganiserName({Key key, this.title}) : super(key: key);
  @override
  _AddEventOrganiserNameState createState() => _AddEventOrganiserNameState();
}

class _AddEventOrganiserNameState extends State<AddEventOrganiserName> {
  TextEditingController eventNameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormHeading(heading: widget.title),
          Container(
            child: TextField(
              style: Theme.of(context).textTheme.body2,
              controller: eventNameController,
              decoration: InputDecoration(
                hintText: "Enter name here...",
                hintStyle: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
          RoundClippedButton(isMain: false, onPress: () {}),
        ],
      ),
    );
  }
}
