import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/event_details/event_details.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:flutter/material.dart';

class DashboardTopTile extends StatelessWidget {
  final Map event;

  DashboardTopTile({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => pushScreen(context, screen: EventDetails(event: event)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: dashboardTopTabBackground(path: event['coverPhotoURL']),
          width: size.width * 0.2,
          height: size.width * 0.2,
          alignment: Alignment.center,
          child: Text(
            truncateStrings(event['name'], 20),
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.body1.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
