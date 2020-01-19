import 'package:Sufi_Circles/src/models/events_list/EventsListModel.dart';
import 'package:Sufi_Circles/src/models/recommended_events/RecommendedEventsModel.dart';
import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestEventTiles extends StatelessWidget {
  final int index;

  const LatestEventTiles({Key key, this.index}) : super(key: key);

  Widget _buildEventHeading(context, String title) {
    return Container(
      alignment: Alignment.center,
      width: title.length.toDouble() * 20,
      child: Text(
        title,
        style: Theme.of(context).textTheme.display1.apply(color: Colors.white),
      ),
    );
  }

  Widget _buildDivider(context, String title) {
    return Container(
      width: title.length.toDouble() * 11,
      child: Divider(
        color: Theme.of(context).errorColor,
        thickness: 2,
        height: 1,
      ),
    );
  }

  Widget _buildEventDesc(context, String desc) {
    return Text(
      desc,
      style: Theme.of(context).textTheme.body1,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    EventsListModel eventModel = Provider.of<EventsListModel>(context);
    final size = MediaQuery.of(context).size;
    if (eventModel.allEvents.length - 1 > index) {
      final detail = getEventDetailsUsingIndex(eventModel.allEvents[index]);
      return new Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: size.width * 0.9,
            height: size.height * 0.225,
            decoration:
                dashboardTopTabBackground(path: detail['coverPhotoURL']),
            child: FlatButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildEventHeading(context, detail['name']),
                  _buildDivider(context, detail['name']),
                  _buildEventDesc(context, detail['desc']),
                ],
              ),
            ),
          ),
        ),
      );
    } else
      return Container();
  }
}
