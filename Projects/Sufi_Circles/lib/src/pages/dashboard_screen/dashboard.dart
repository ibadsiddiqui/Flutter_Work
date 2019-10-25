import 'package:Sufi_Circles/src/models/recommended_events/RecommendedEventsModel.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/drawer.dart';
import 'package:Sufi_Circles/src/widgets/dashboard/lastest_events_tiles.dart';
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

  Widget _buildBody(recommendedEventsModel, size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: size.height * 0.6,
      child: ListView.builder(
          itemCount: recommendedEventsModel.recommendedEvents.length,
          itemBuilder: (context, int idx) => LatestEventTiles(index: idx)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RecommendedEventsModel recommendedEventsModel =
        Provider.of<RecommendedEventsModel>(context);
    return Scaffold(
      appBar: dashboardAppBar(isSearching: isSearching, onPress: toggleSearch),
      drawer: DashboardDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.5, bottom: 5.0),
            child: DashboardHeadings(title: "Recommended Events"),
          ),
          _buildHeader(recommendedEventsModel),
          Padding(
            padding: const EdgeInsets.only(top: 2.5, bottom: 5.0),
            child: DashboardHeadings(title: "Latest Events"),
          ),
          _buildBody(recommendedEventsModel, size),
        ],
      ),
    );
  }
}
