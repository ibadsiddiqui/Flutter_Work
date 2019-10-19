import 'package:Sufi_Circles/src/navigator/auth_navigator.dart';
import 'package:Sufi_Circles/src/widgets/onboard/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: OnboardPages(),
        ),
      ),
    );
  }
}

class OnboardPages extends StatefulWidget {
  @override
  _OnboardPagesState createState() => _OnboardPagesState();
}

class _OnboardPagesState extends State<OnboardPages> {
  final pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  moveToNextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          OnboardPageView(
            assetPath: 'asset/images/onboard/onboard1.jpg',
            title: "STARTUP",
            onPressed: moveToNextPage,
            desc:
                "Sufi Circles is a worldwide platform for encounters with Sufism and allows its users to form, share, discover sufi events that fuel their interests and improve their lives.",
          ),
          OnboardPageView(
            assetPath: 'asset/images/onboard/onboard2.jpg',
            title: "ABOUT US",
            onPressed: moveToNextPage,
            desc:
                "The name Sufi Circles derives from 'Halqa-e-Dhikr', arabic for 'Circle of Divine Remembrance', a mystical gathering aiming at union with the Beloved.",
          ),
          OnboardPageView(
            assetPath: 'asset/images/onboard/onboard3.jpg',
            title: "FEATURES",
            onPressed: () => pushLoginScreen(context),
            desc:
                "- Coverage of sufi events and activities across the globe.\n- Search for sufi circles around you.\n- View and share events.\n- Get notifications for events nearby.\n- Fun and easy to use.",
          ),
        ],
      ),
    );
  }
}
