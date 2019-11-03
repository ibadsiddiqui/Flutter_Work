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
        leading: Icon(Icons.close, color: Color(0xFF072247)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
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
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  minLines: 2,
                  maxLength: 250,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontFamily: "Comfortaa"),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10, bottom: 120),
                      focusedBorder: InputBorder.none,
                      hintText:
                          "Enter a brief summary of your event so guests know what to expect."),
                ),
                // SizedBox(height: size.height * 0.1),
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(100),
                      right: Radius.circular(100),
                    ),
                    child: RaisedButton(
                      color: Color(0xFF072247),
                      splashColor: Color(0xFFFC3C3C),
                      elevation: 5,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
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
