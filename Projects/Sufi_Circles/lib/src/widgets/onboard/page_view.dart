import 'package:Sufi_Circles/src/widgets/onboard/description.dart';
import 'package:Sufi_Circles/src/widgets/onboard/heading.dart';
import 'package:flutter/material.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView(
      {Key key, this.assetPath, this.title, this.desc, this.onPressed})
      : super(key: key);

  final String assetPath;
  final String title;
  final String desc;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF072247),
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
                OnBoardHeading(title: title),
                OnBoardDescription(desc: desc),
                Divider(
                    height: title == "FEATURES"
                        ? 65
                        : title == "STARTUP" ? 100 : 100),
                Container(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: title == "FEATURES"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                                Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Comfortaa",
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                )
                              ])
                        : Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                    onPressed: onPressed,
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
