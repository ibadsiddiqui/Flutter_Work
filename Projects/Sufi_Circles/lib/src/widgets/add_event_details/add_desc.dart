import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/multiline_input.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventDescDetail extends StatefulWidget {
  final String title;
  final Function moveToNextPage;
  AddEventDescDetail({Key key, this.title, this.moveToNextPage})
      : super(key: key);

  @override
  _AddEventDescDetailState createState() => _AddEventDescDetailState();
}

class _AddEventDescDetailState extends State<AddEventDescDetail> {
  TextEditingController _eventNameController = TextEditingController(text: "");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String desc = Provider.of<EventModel>(context).eventDesc.value;
    _eventNameController = TextEditingController(text: desc);
  }

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormHeading(heading: widget.title),
          MultiLineInput(
            maxLength: 750,
            maxLines: 10,
            minLines: 2,
            controller: _eventNameController,
            hintText:
                "Enter a brief summary of your event so guests know what to expect. (optional)",
            onChanged: eventModel.setEventDesc,
          ),
          RoundClippedButton(
            isMain: false,
            onPress: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              widget.moveToNextPage();
            },
          ),
        ],
      ),
    );
  }
}
