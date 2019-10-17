import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(8, 51, 88, 1),
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
  final pageController = PageController(initialPage: 1);
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    // pageController = PageController(viewportFraction: 0.8);
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
      height: MediaQuery.of(context).size.height * 0.8,
      // width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // SlidingCard(
          //   name:
          //       'Sufi Circles is a worldwide platform for encounters with Sufism and allows its users to form, share, discover sufi events that fuel their interests and improve their lives.',
          //   date: '4.20-30',
          //   assetName: 'images/onboard/onboard3.jpg',
          //   offset: pageOffset,
          // ),
          // SlidingCard(
          //   name: 'Dawan District, Guangdong Hong Kong and Macao',
          //   date: '4.28-31',
          //   assetName: "images/onboard/onboard2.jpg",
          //   offset: pageOffset - 1,
          // ),
          // SlidingCard(
          //   name: 'Dawan District, Guangdong Hong Kong and Macao',
          //   date: '4.28-31',
          //   assetName: "images/onboard/onboard3.jpg",
          //   offset: pageOffset - 1,
          // ),
          Container(
            color: Colors.black,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          )

          // Image.asset(
          //   'images/onboard/onboard3.jpg',
          //   height: 100,
          //   width: 100,
          // ),
          // Image.asset(
          //   'images/onboard/onboard3.jpg',
          //   height: 100,
          //   width: 100,
          // ),
          // Image.asset(
          //   'images/onboard/onboard3.jpg',
          //   height: 100,
          //   width: 100,
          // ),
          // Image.asset(
          //   'images/onboard/onboard3.jpg',
          //   height: 100,
          //   width: 100,
          // ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'asset/$assetName',
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              // Transform.translate(
              //   offset: Offset(48 * offset, 0),
              //   child: RaisedButton(
              //     color: Color(0xFF162A49),
              //     child: Transform.translate(
              //       offset: Offset(24 * offset, 0),
              //       child: Text('Reserve'),
              //     ),
              //     textColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(32),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF162A49),
                ),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
