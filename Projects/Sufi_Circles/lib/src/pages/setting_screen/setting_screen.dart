import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildHeader(size) {
    return Container(
      height: size.height * 0.25,
      color: Colors.blue,
      padding: EdgeInsets.only(top: 70),
      child: Column(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                height: size.height * 0.1,
                width: size.height * 0.1,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  "I",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 33, fontFamily: "Comfortaa"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "Ibad Siddiqui",
              style: TextStyle(fontSize: 20.0, fontFamily: "CreteRound"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildHeader(size),
          Container(
            height: size.height * 0.75,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: Text("Settings",
                          style: TextStyle(
                              fontSize: 25.0, fontFamily: "CreteRound")),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                          color: Colors.grey, thickness: 0.5, height: 0),
                    )
                  ],
                ),
                SizedBox(height: 20),
                UserDetailItem(
                  label: "Privacy Policy",
                  value: "click to view them...",
                  screenName: "setting",
                ),
                UserDetailItem(
                    label: "Terms & Condition:",
                    value: "click to view them...",
                    screenName: "setting"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
