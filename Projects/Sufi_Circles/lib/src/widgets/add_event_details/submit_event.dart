import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

enum PublishEvent { unpublished, publishing, published }

class SubmitEvent extends StatefulWidget {
  @override
  _SubmitEventState createState() => _SubmitEventState();
}

class _SubmitEventState extends State<SubmitEvent> {
  PublishEvent publishingEvent = PublishEvent.unpublished;

  _submitEventForPublication() {
    this.setState(() => publishingEvent = PublishEvent.publishing);
  }

  @override
  Widget build(BuildContext context) {
    switch (publishingEvent) {
      case PublishEvent.publishing:
        return Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Publishing...",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2,
              ),
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
              Text(
                "The event has successfully been published.",
                style: Theme.of(context).textTheme.body2,
              ),
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
                Text(
                  "Click on the button below to publish your event.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.body2,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RoundClippedButton(
                    isMain: true,
                    onPress: this._submitEventForPublication,
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
