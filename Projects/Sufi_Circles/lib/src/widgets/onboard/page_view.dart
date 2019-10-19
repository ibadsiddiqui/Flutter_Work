import 'package:flutter/material.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView({Key key, this.assetPath, this.title, this.desc})
      : super(key: key);

  final String assetPath;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(8, 51, 88, 1),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              child: Image.asset(
                assetPath,
                fit: BoxFit.fitHeight,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: "CreteRound",
                        fontSize: 30,
                        color: Colors.white,
                        decorationStyle: TextDecorationStyle.dashed,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    desc,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: "Comfortaa"),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Divider(height: title == "FEATURES" ? 60 : 100),
                Container(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
