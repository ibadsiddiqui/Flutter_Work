import 'package:Sufi_Circles/src/models/recommended_events/RecommendedEventsModel.dart';
import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestEventTiles extends StatelessWidget {
  final int index;

  const LatestEventTiles({Key key, this.index}) : super(key: key);

  Widget _buildEventHeading(String title) {
    return Container(
      alignment: Alignment.center,
      width: title.length.toDouble() * 20,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 22.0),
      ),
    );
  }

  Widget _buildDivider(String title) {
    return Container(
      width: title.length.toDouble() * 11,
      child: Divider(
        color: Color(0xFFFC3C3C),
        thickness: 2,
        height: 1,
      ),
    );
  }

  Widget _buildEventDesc(String desc) {
    return Text(
      desc,
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    RecommendedEventsModel recommendedEventsModel =
        Provider.of<RecommendedEventsModel>(context);
    final size = MediaQuery.of(context).size;
    if (recommendedEventsModel.recommendedEvents.length - 1 > index) {
      final detail = getEventDetailsUsingIndex(
          recommendedEventsModel.recommendedEvents[index]);

      return new Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: size.width * 0.9,
            height: size.height * 0.225,
            decoration:
                dashboardTopTabBackground(path: detail['eventCoverPhoto']),
            child: FlatButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildEventHeading(detail['eventName']),
                  _buildDivider(detail['eventName']),
                  _buildEventDesc(detail['eventDesc']),
                ],
              ),
            ),
          ),
        ),
      );
    }else return Container();
  }
}
