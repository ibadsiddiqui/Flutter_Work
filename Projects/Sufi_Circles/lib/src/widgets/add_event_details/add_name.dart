import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';

class AddEventNameDetail extends StatefulWidget {
  final String inputHint;
  final String title;
  final String value;
  final String onChange;
  AddEventNameDetail(
      {Key key, this.inputHint, this.title, this.value, this.onChange})
      : super(key: key);

  @override
  _AddEventNameDetailState createState() => _AddEventNameDetailState();
}

class _AddEventNameDetailState extends State<AddEventNameDetail> {
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
                hintText: widget.inputHint,
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
