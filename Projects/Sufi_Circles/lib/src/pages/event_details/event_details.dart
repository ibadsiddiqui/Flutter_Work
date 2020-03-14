import 'package:Sufi_Circles/src/utils/date_helper.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:Sufi_Circles/src/widgets/map/camera_position.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetails extends StatefulWidget {
  final Map<String, dynamic> event;

  EventDetails({Key key, this.event}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();

  String getAudience() {
    String _audience = isAudienceLimited(widget.event["audience"])
        ? widget.event["audienceRange"]
        : widget.event["audience"];

    return _audience.contains("No Limit") ? _audience : "$_audience Person";
  }

  Set<Marker> eventMarker(String lat, String long) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("event"),
        position: LatLng(double.parse(lat), double.parse(long)),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    return _markers;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String startDate =
        format(formatTimestamp(widget.event["dateFrom"])).toString();
    String startTime = formateDateAndTimeForEvent(widget.event["startTime"]);
    String audience = getAudience();
    Map<dynamic, dynamic> location = widget.event["locationDetails"];
    List<dynamic> photos = widget.event["venuePhotosURLList"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.01),
        elevation: 0,
      ),
      body: ListView(
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
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .apply(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Text(startDate + " at " + startTime),
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
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              toTitleCase(location["name"]),
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              getFullAddress(location),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
          Container(
            padding: location["long"].toString().isEmpty
                ? EdgeInsets.all(0)
                : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // color: Colors.red,
            width: size.width,
            height:
                location["long"].toString().isNotEmpty ? size.height * 0.3 : 0,
            child: location["long"].toString().isNotEmpty
                ? GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: cameraPostionForMap(
                      location["lat"].toString(),
                      location["long"].toString(),
                      zoom: 13.0,
                    ),
                    markers: this.eventMarker(location["lat"].toString(),
                        location["long"].toString()),
                    mapType: MapType.normal,
                    onMapCreated: (controller) =>
                        controller.animateCamera(updateCamera(
                      location["lat"].toString(),
                      location["long"].toString(),
                      zoom: 13.0,
                    )),
                  )
                : Container(),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Event details",
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "askdbasdb jhasbdasbd habsdlansdjl  asdajsndlasj las lasndl nasjkldn asjkdnjkasnd klasnld",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Photos",
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: size.height * 0.3,
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              itemBuilder: (context, int idx) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  // color: Colors.red,
                  child: InkWell(
                    onTap: () => HeroAnimation(photoPath: photos[idx]),
                    child: Image.network(
                      photos[idx],
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Loading.."),
                              CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
