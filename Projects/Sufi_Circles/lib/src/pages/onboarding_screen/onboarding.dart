import 'dart:async';

import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/pages/login_screen/login.dart';
import 'package:Sufi_Circles/src/widgets/onboard/page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController;
  bool _visible = false;

  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    new Timer(Duration(seconds: 3), toggleOpacity);
  }

  toggleOpacity() => setState(() => _visible = !_visible);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  moveToNextPage(context) {
    if (pageController.page.floor() < 2)
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    else if (pageController.page.floor() == 2)
      Navigator.pushReplacement(context, createRoute(screen: LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView(
              controller: pageController,
              children: <Widget>[
                SlidingCard(
                    name:
                        'Sufi Circles is a worldwide platform for encounters with Sufism and allows its users to form, share, discover sufi events that fuel their interests and improve their lives.',
                    assetName: "images/dummy_events/event_1.jpg",
                    offset: pageOffset - pageController.page,
                    onPress: () => moveToNextPage(context)),
                SlidingCard(
                    name:
                        "The name Sufi Circles derives from 'Halqa-e-Dhikr', arabic for 'Circle of Divine Remembrance', a mystical gathering aiming at union with the Beloved.",
                    assetName: "images/dummy_events/event_1.jpg",
                    offset: pageOffset - pageController.page,
                    onPress: () => moveToNextPage(context)),
                SlidingCard(
                    name:
                        "- Coverage of sufi events and activities across the globe.\n- Search for sufi circles around you.\n- View and share events.\n- Get notifications for events nearby.\n- Fun and easy to use.",
                    assetName: "images/dummy_events/event_1.jpg",
                    offset: pageOffset - pageController.page,
                    onPress: () => moveToNextPage(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
