import 'package:Sufi_Circles/src/widgets/buttons/round_clipped_button.dart';
import 'package:Sufi_Circles/src/widgets/create_event/multiline_input.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color(0xFF072247)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          // physics: new NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Event name.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Color(0xFF072247),
                      fontFamily: "CreteRound",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MultiLineInput(
                      maxLines: 2,
                      minLines: 1,
                      maxLength: 10,
                      hintText: "Please add a name for the event.(mandatory)"),
                  RoundClippedButton(isMain: false, onPress: () {}),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Describe your event.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Color(0xFF072247),
                      fontFamily: "CreteRound",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MultiLineInput(
                      maxLines: 10,
                      minLines: 2,
                      maxLength: 250,
                      hintText:
                          "Enter a brief summary of your event so guests know what to expect.(Optional)"),
                  RoundClippedButton(isMain: false, onPress: () {}),
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
      ),
    );
  }
}
