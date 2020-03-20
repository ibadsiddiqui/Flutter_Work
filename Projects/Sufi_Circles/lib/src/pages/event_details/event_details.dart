import 'package:Sufi_Circles/src/utils/date_helper.dart';
import 'package:Sufi_Circles/src/utils/share_utils.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:Sufi_Circles/src/widgets/event_details/headings.dart';
import 'package:Sufi_Circles/src/widgets/event_details/links.dart';
import 'package:Sufi_Circles/src/widgets/event_details/photos_list.dart';
import 'package:Sufi_Circles/src/widgets/map/small_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetails extends StatefulWidget {
  final Map<String, dynamic> event;

  EventDetails({Key key, this.event}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final Set<Marker> _markers = new Set();
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() => super.dispose();

  openURI(String url) async {
    bool urlStatus = await ShareUtils.openURI(url);
    if (urlStatus)
      await launch(url);
    else {
      final snackBar = SnackBar(
        content: Text('Are you talkin\' to me?'),
        backgroundColor: Colors.red,
      );
      return globalKey.currentState.showSnackBar(snackBar);
    }
  }

  String getAudience() {
    String _audience = isAudienceLimited(widget.event["audience"])
        ? widget.event["audienceRange"]
        : widget.event["audience"];

    return _audience.contains("No Limit") ? _audience : "$_audience Person";
  }

  Set<Marker> eventMarker(double lat, double long) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("event"),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return _markers;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String formattedDate = formatTimestamp(widget.event["dateFrom"]).toString();

    String startDate = formattedDate
        .substring(0, formattedDate.indexOf(" "))
        .replaceAll("-", "/");
    String startTime = formateDateAndTimeForEvent(widget.event["startTime"]);
    String audience = getAudience();
    Map<dynamic, dynamic> location = widget.event["locationDetails"];
    List<dynamic> photos = widget.event["venuePhotosURLList"];
    Map eventLinks = widget.event["eventLinks"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.01),
        elevation: 0,
      ),
      body: ListView(
        primary: true,
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            decoration:
                dashboardTopTabBackground(path: widget.event["coverPhotoURL"]),
            height: size.height * 0.4,
            width: size.width,
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          widget.event["name"],
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .apply(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Text(startDate.replaceAll("about", "") +
                            " at " +
                            startTime),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Audience",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(audience),
                    )
                  ],
                ),
              ],
            ),
          ),
          buildHeadings(context, location["name"]),
          buildDescription(getFullAddress(location)),
          Container(
            padding: location["long"].toString().isEmpty
                ? EdgeInsets.all(0)
                : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.width,
            height:
                location["long"].toString().isNotEmpty ? size.height * 0.3 : 0,
            child: location["long"].toString().isNotEmpty
                ? buildSmallMap(location["lat"], location["long"],
                    eventMarker(location["lat"], location["long"]))
                : Container(),
          ),
          buildHeadings(context, "Event details"),
          buildDescription(widget.event["desc"]),
          buildPhotosList(context,
              heading: buildHeadings(context, "Photos"), photos: photos),
          buildEventLinkSection(context, eventLinks),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
