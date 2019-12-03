import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/popup/dialog_show.dart';
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
  TextEditingController eventNameController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String eventName = Provider.of<EventModel>(context).eventName.value;
    eventNameController = TextEditingController(text: eventName);
  }

  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EventModel eventModel = Provider.of<EventModel>(context);
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
              onChanged: eventModel.setEventName,
              decoration: InputDecoration(
                hintText: "Enter name here...",
                hintStyle: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
          Observer(
            builder: (_) => eventModel.eventName.value.isNotEmpty
                ? GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(FocusNode()),
                    child: RoundClippedButton(
                      isMain: false,
                      onPress: () => widget.moveToNextPage(),
                    ))
                : Container(),
          ),
        ],
      ),
    );
  }
}
