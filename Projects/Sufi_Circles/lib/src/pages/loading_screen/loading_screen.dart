import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/controllers/db/DB_Controller.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';

class LoadingScreen extends StatefulWidget {
  final String uid;

  const LoadingScreen({Key key, this.uid}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  DBController _dbController = DBController();

  @override
  void initState() {
    super.initState();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() async => getUserDetails();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Loader(),
            SizedBox(height: 10),
            Text(
              "Loading all the good things happening around...",
              style: TextStyle(fontFamily: "Comfortaa"),
            )
          ],
        ),
      ),
    );
  }

  void getUserDetails() async {
    await _dbController.setUserDetailsUsingID(context, widget.uid);
    TimeNavigation.navigate(context, DashboardScreen(), second: 4);
  }
}
