import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SlidingCardsView(),
        ),
      ),
    );
  }
}

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  final pageController = PageController(initialPage: 0);
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height.8,
      // width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            color: Color.fromRGBO(8, 51, 88, 1),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Image.asset(
                      'asset/images/onboard/onboard1.jpg',
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
                          "STARTUP",
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
                          "Sufi Circles is a worldwide platform for encounters with Sufism and allows its users to form, share, discover sufi events that fuel their interests and improve their lives.",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "Comfortaa"),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(
                        height: 100,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(8, 51, 88, 1),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Image.asset(
                      'asset/images/onboard/onboard2.jpg',
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
                          "ABOUT US",
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
                          "The name Sufi Circles derives from 'Halqa-e-Dhikr', arabic for 'Circle of Divine Remembrance', a mystical gathering aiming at union with the Beloved.",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "Comfortaa"),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(
                        height: 100,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(8, 51, 88, 1),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Image.asset(
                      'asset/images/onboard/onboard3.jpg',
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
                          "FEATURES",
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
                          "- Coverage of sufi events and activities across the globe.\n- Search for sufi circles around you.\n- View and share events.\n- Get notifications for events nearby.\n- Fun and easy to use.",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "Comfortaa"),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(
                        height: 60,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
