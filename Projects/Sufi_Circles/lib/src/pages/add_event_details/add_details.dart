import 'package:flutter/material.dart';

class AddEventDetails extends StatefulWidget {
  AddEventDetails({Key key}) : super(key: key);

  @override
  _AddEventDetailsState createState() => _AddEventDetailsState();
}

class _AddEventDetailsState extends State<AddEventDetails> {
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
    return new Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Describe your event.",
                  style: TextStyle(
                    color: Color(0xFF072247),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Text('asd basd'),
          ),
          Container(
            child: Text('asd basd'),
          )
        ],
      ),
    );
  }
}
