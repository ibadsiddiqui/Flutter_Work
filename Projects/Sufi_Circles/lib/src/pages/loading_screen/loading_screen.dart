import 'package:Sufi_Circles/src/controllers/db/UserDBController.dart';
import 'package:Sufi_Circles/src/navigator/timed_navigation.dart';
import 'package:Sufi_Circles/src/pages/dashboard_screen/dashboard.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final String uid;

  LoadingScreen({Key key, this.uid = ""}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  UserDBController _userDBController = UserDBController();

  @override
  void initState() => super.initState();

  @protected
  @mustCallSuper
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await this._getUserDetails();
  }

  @override
  void dispose() => super.dispose();

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

  Future<void> _getUserDetails() async {
    await _userDBController.setUserDetailsUsingID(context, widget.uid);
    TimeNavigation.navigate(context, DashboardScreen(), second: 4);
  }
}
