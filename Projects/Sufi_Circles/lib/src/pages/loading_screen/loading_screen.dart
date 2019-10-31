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

  @protected
  @mustCallSuper
  Future didChangeDependencies() async => getUserDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Loader(),
            Text(
              "Loading all the good things happening around...",
              style: TextStyle(fontFamily: "Comfortaa"),
            )
          ],
        ),
      ),
    );
  }

  void getUserDetails() {
    _dbController.setUserDetailsUsingID(context, widget.uid);
  }
}
