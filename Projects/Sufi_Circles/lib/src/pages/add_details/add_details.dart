import 'package:Sufi_Circles/src/widgets/add_event_details/add_desc.dart';
import 'package:Sufi_Circles/src/widgets/add_event_details/add_name.dart';
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
      resizeToAvoidBottomPadding: false,
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
            AddEventNameDetail(
              title: "Tell us your event name.",
              inputHint: "Enter a good name for the event. (mandatory)",
            ),
            AddEventDescDetail(
              title: "Describe your event.",
              inputHint:
                  "Enter a brief summary of your event so guests know what to expect.(Optional)",
            ),
          ],
        ),
      ),
    );
  }
}
