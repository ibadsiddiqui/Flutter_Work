import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/models/event/EventModel.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/utils/message.dart';
import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum PublishEvent { unpublished, publishing, published }

class SubmitEvent extends StatefulWidget {
  @override
  _SubmitEventState createState() => _SubmitEventState();
}

class _SubmitEventState extends State<SubmitEvent> {
  PublishEvent _publishingEvent = PublishEvent.unpublished;
  EventDBController _eventDBController = new EventDBController();

  _submitEventForPublication(context) async {
    this.setState(() => _publishingEvent = PublishEvent.publishing);
    try {
      bool isCreated = await _eventDBController.createEvent(context);
      if (isCreated) {
        this.setState(() => _publishingEvent = PublishEvent.published);
        Scaffold.of(context)
            .showSnackBar(showSuccessMessage("Event successfully created."));
        Provider.of<EventModel>(context).resetAll();
        TimeNavigation.navigate(context, DashboardScreen(), second: 4);
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(
          showErrorMessage("Something went wrong. Please try again."));
      this.setState(() => _publishingEvent = PublishEvent.unpublished);
    }
  }

  Widget giveDescription(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.body2,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_publishingEvent) {
      case PublishEvent.publishing:
        return Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              giveDescription("Publishing..."),
              Divider(color: Colors.white),
              Loader(
                dotOneColor: Colors.redAccent,
                dotTwoColor: Colors.blueAccent,
                dotThreeColor: Colors.greenAccent,
                dotType: DotType.circle,
                dotIcon: Icon(Icons.adjust),
                duration: Duration(milliseconds: 1000),
              ),
            ],
          ),
        );
        break;
      case PublishEvent.published:
        return Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              giveDescription("The event has successfully been published."),
              Container(
                alignment: Alignment.center,
                child: Icon(Icons.check, color: Colors.green),
              ),
            ],
          ),
        );
        break;
      default:
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                giveDescription(
                    "Click on the button below to publish your event."),
                Container(
                  alignment: Alignment.center,
                  child: RoundClippedButton(
                    isMain: true,
                    onPress: () => this._submitEventForPublication(context),
                    child:
                        Text("Publish", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
