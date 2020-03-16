import 'package:Sufi_Circles/src/utils/date_helper.dart';
import 'package:Sufi_Circles/src/utils/string_helper.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:Sufi_Circles/src/widgets/map/camera_position.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_picture_background.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';
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

  Widget renderHeadings(String heading) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.display1,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget renderSubHeadings(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColor),
        textAlign: TextAlign.left,
      ),
    );
  }

  openURI(String url) async {
    if (await canLaunch(url))
      await launch(url);
    else {
      final snackBar = SnackBar(
        content: Text('Are you talkin\' to me?'),
        backgroundColor: Colors.red,
      );
      return globalKey.currentState.showSnackBar(snackBar);
    }
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
    Map eventLinks = widget.event["eventLinks"];
    print(eventLinks);

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
          renderHeadings(location["name"]),
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
                    myLocationButtonEnabled: true,
                    mapToolbarEnabled: true,
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
          renderHeadings("Event details"),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "askdbasdb jhasbdasbd habsdlansdjl  asdajsndlasj las lasndl nasjkldn asjkdnjkasnd klasnld",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  renderHeadings("Photos"),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "See all",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: size.height * 0.3,
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      photos.length < 4 ? photos.length : photos.length - 3,
                  itemBuilder: (context, int idx) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 2),
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
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
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
          renderHeadings("Links"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FlatButton(
                  onPressed: () => openURI("http://facebook.com"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.adjust, color: Theme.of(context).primaryColor),
                      renderSubHeadings("Facebook"),
                      Text(eventLinks["facebook"],
                          style: TextStyle(color: Colors.blueGrey))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FlatButton(
                  onPressed: () => openURI("http://facebook.com"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.adjust, color: Theme.of(context).primaryColor),
                      renderSubHeadings("Instagram"),
                      Text(eventLinks["instagram"],
                          style: TextStyle(color: Colors.blueGrey))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.adjust, color: Theme.of(context).primaryColor),
                    renderSubHeadings("Website"),
                    Text(eventLinks["website"],
                        style: TextStyle(color: Colors.blueGrey))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
