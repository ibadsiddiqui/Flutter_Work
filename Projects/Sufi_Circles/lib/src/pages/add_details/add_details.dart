import 'package:Sufi_Circles/src/widgets/add_event_details/add_cover_photo.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_desc.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_event_dates.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_event_organiser_name.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_event_time.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_name.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_organisers_desc.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_targetted_audience_limit.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_venue_desc.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_venue_photos.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_web_urls.dart';
import 'package:flutter/material.dart';

class AddEventDetails extends StatefulWidget {
  AddEventDetails({Key key}) : super(key: key);

  @override
  _AddEventDetailsState createState() => _AddEventDetailsState();
}

class _AddEventDetailsState extends State<AddEventDetails> {
  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  moveToNextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: Text(
              "Click to cancel",
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Color(0xFF072247)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: new NeverScrollableScrollPhysics(),
          children: <Widget>[
            AddEventOrganiserName(
              title: "Tell us the Organiser's name.*",
              moveToNextPage: moveToNextPage,
            ),
            AddEventNameDetail(
              title: "Tell us your event name.*",
              moveToNextPage: moveToNextPage,
            ),
            AddEventDescDetail(
              title: "Describe your event.",
              moveToNextPage: moveToNextPage,
            ),
            AddTargettedAudienceLimit(moveToNextPage: moveToNextPage,),
            AddEventCoverPhoto(),
            AddVenuePhotos(),
            AddEventDate(),
            AddEventTime(),
            AddVenueDesc(),
            AddOrganisersDetails(),
            AddEventWebURLs(),
          ],
        ),
      ),
    );
  }
}
