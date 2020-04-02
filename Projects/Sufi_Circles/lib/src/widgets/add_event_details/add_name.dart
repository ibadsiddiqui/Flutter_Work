import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventNameDetail extends StatefulWidget {
  final String title;
  final Function moveToNextPage;
  AddEventNameDetail({Key key, this.title, this.moveToNextPage})
      : super(key: key);

  @override
  _AddEventNameDetailState createState() => _AddEventNameDetailState();
}

class _AddEventNameDetailState extends State<AddEventNameDetail> {
  TextEditingController eventNameController = TextEditingController(text: "");

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          FormHeading(heading: widget.title),
          Container(
            child: TextField(
              style: Theme.of(context).textTheme.body2,
              controller: eventNameController,
              onChanged: eventModel.setEventName,
              decoration: InputDecoration(
                hintText: "Enter name here...",
                hintStyle: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
          Observer(
            builder: (_) => eventModel.eventName.value.isNotEmpty
                ? RoundClippedButton(
                    isMain: false,
                    onPress: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.moveToNextPage();
                    })
                : Container(),
          ),
        ],
      ),
    );
  }
}
