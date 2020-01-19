import 'package:Sufi_Circles/src/controllers/db/EventDBController.dart';
import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/models/events_list/EventsListModel.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  final String uid;

  const LoadingScreen({Key key, this.uid = ""}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  UserDBController _userDBController = UserDBController();
  EventDBController _eventDBController = EventDBController();

  @override
  void initState() {
    super.initState();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() async {
    super.didChangeDependencies();
    getUserDetails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Loader(),
            SizedBox(height: 10),
            Text(
              "Loading all the good things happening around...",
              style: TextStyle(
                color: Colors.white,
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
              ),
            )
          ],
        ),
      ),
    );
  }

  void getUserDetails() async {
    await _userDBController.setUserDetailsUsingID(context, widget.uid);
    List events = await _eventDBController.getAllEvent();
    Provider.of<EventsListModel>(context).setAllEvent(events);
    TimeNavigation.navigate(context, DashboardScreen(), second: 4);
  }
}
