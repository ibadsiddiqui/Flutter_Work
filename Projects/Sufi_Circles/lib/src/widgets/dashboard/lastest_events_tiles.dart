import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/event_details/event_details.dart';
import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LatestEventTiles extends StatelessWidget {
  final int index;
  final List<DocumentSnapshot> snapshots;

  LatestEventTiles({Key key, this.index, this.snapshots}) : super(key: key);

  Widget _buildEventHeading(context, String title) {
    return Container(
      alignment: Alignment.center,
      width: title.length.toDouble() * 20,
      child: Text(
        truncateStrings(title, 15),
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
      style: Theme.of(context).textTheme.body1.apply(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (this.snapshots.length - 1 > index) {
      final detail = getEventDetailsUsingIndex(this.snapshots[index]);
      return FlatButton(
        onPressed: () =>
            pushScreen(context, screen: EventDetails(event: snapshots[index].data)),
        child: new Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: size.width * 0.95,
              height: size.height * 0.25,
              decoration:
                  dashboardTopTabBackground(path: detail['coverPhotoURL']),
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
