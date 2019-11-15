import 'package:Sufi_Circles/src/widgets/loader/dot_type.dart';
import 'package:Sufi_Circles/src/widgets/loader/loader.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
    this.title = "",
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: new FlatButton(
                color: Color.fromRGBO(8, 51, 88, 1),
                splashColor: Color.fromRGBO(7, 34, 71, 1),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                onPressed: isLoading == false ? onPressed : () => false,
                child: isLoading
                    ? Loader(
                        dotOneColor: Colors.redAccent,
                        dotTwoColor: Colors.blueAccent,
                        dotThreeColor: Colors.greenAccent,
                        dotType: DotType.circle,
                        dotIcon: Icon(Icons.adjust),
                        duration: Duration(milliseconds: 750),
                      )
                    : Text(this.title,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Comfortaa")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
