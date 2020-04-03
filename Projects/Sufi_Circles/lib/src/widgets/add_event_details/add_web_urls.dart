import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/form/form_heading.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddEventWebURLs extends StatefulWidget {
  final Function moveToNextPage;

  AddEventWebURLs({Key key, this.moveToNextPage}) : super(key: key);
  @override
  _AddEventWebURLsState createState() => _AddEventWebURLsState();
}

class _AddEventWebURLsState extends State<AddEventWebURLs> {
  TextEditingController eventFacebookLinkController;
  TextEditingController eventWebLinkController;
  TextEditingController eventInstagramLinkController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    EventModel eventModel = Provider.of<EventModel>(context);
    eventFacebookLinkController =
        TextEditingController(text: eventModel.faceboookLink);
    eventWebLinkController = TextEditingController(text: eventModel.webLink);
    eventInstagramLinkController =
        TextEditingController(text: eventModel.instagramLink);
  }

  @override
  void dispose() {
    eventFacebookLinkController.dispose();
    eventWebLinkController.dispose();
    eventInstagramLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormHeading(heading: "Add Event URLs. (optional)"),
          Observer(
            builder: (_) => Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SizedBox(height: 20),
                  Text(
                    "Facebook URL:",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.body2,
                    controller: eventFacebookLinkController,
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Website URL:",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  TextField(
                    controller: eventWebLinkController,
                    style: Theme.of(context).textTheme.body2,
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Instagram URL:",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  TextField(
                    controller: eventInstagramLinkController,
                    style: Theme.of(context).textTheme.body2,
                    decoration: InputDecoration(
                      hintText: "Enter here...",
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RoundClippedButton(isMain: false, onPress: widget.moveToNextPage),
        ],
      ),
    );
  }
}
