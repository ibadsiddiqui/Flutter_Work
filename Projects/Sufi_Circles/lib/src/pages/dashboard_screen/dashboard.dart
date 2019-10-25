import 'package:Sufi_Circles/src/models/recommended_events/RecommendedEventsModel.dart';
import 'package:Sufi_Circles/src/utils/model_helper_methods.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/background.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/appbar.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/heading.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/top_tile.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSearching = false;

  toggleSearch() => this.setState(() => isSearching = !isSearching);

  Widget _buildHeader(recommendedEventsModel) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.475,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
        crossAxisSpacing: MediaQuery.of(context).size.height * 0.015,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: _generateHeaderList(recommendedEventsModel),
      ),
    );
  }

  List<Widget> _generateHeaderList(recommendedEventsModel) {
    return List.generate(
      recommendedEventsModel.recommendedEvents.length - 1,
      (idx) {
        String desc = recommendedEventsModel.getEventDesc(idx);
        String coverPhoto = recommendedEventsModel.getEventCoverPhoto(idx);
        return DashboardTopTile(
          eventDesc: desc,
          eventCoverPhoto: coverPhoto,
        );
      },
    );
  }

  Widget _buildBody(recommendedEventsModel) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: size.height * 0.6,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          if (recommendedEventsModel.recommendedEvents.length - 1 > idx) {
            final detail = getEventDetailsUsingIndex(
                recommendedEventsModel.recommendedEvents[idx]);
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: size.width * 0.9,
                  height: size.height * 0.225,
                  decoration: dashboardTopTabBackground(
                      path: detail['eventCoverPhoto']),
                  child: FlatButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: detail["eventName"].length.toDouble() * 20,
                          child: Text(
                            detail["eventName"],
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                        Container(
                          width: detail["eventName"].length.toDouble() * 10,
                          child: Divider(
                            color: Color(0xFFFC3C3C),
                            thickness: 2,
                            height: 1,
                          ),
                        ),
                        Text(
                          detail["eventDesc"],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white
                              // fontSize: 22.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RecommendedEventsModel recommendedEventsModel =
        Provider.of<RecommendedEventsModel>(context);
    return Scaffold(
      drawer: DashboardDrawer(),
      appBar: dashboardAppBar(isSearching: isSearching, onPress: toggleSearch),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          _buildHeader(recommendedEventsModel),
          Padding(
            padding: const EdgeInsets.only(top: 2.5, bottom: 5.0),
            child: DashboardHeadings(title: "Latest Events"),
          ),
          _buildBody(recommendedEventsModel),
        ],
      ),
    );
  }
}
