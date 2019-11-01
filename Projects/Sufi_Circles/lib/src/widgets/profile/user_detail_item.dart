import 'package:flutter/material.dart';

class UserDetailItem extends StatelessWidget {
  final bool isEditable;
  final String inputLabel;
  final String value;
  final String screenName;
  final Function toggleEdit;
  const UserDetailItem({
    Key key,
    this.value,
    this.inputLabel,
    this.screenName = "profile",
    this.isEditable = false,
    this.toggleEdit,
  }) : super(key: key);

  Widget renderEditableInput(context, size) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: InputBorder.none,
          hasFloatingPlaceholder: true,
          alignLabelWithHint: true,
          labelText: inputLabel,
          labelStyle: TextStyle(fontSize: 20.0, fontFamily: "CreteRound"),
          hintMaxLines: 1,
          suffixIcon: IconButton(
            padding: EdgeInsets.only(top: 20, left: 20),
            tooltip: "Save",
            onPressed: toggleEdit,
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(isEditable);
    final size = MediaQuery.of(context).size;
    if (isEditable)
      return renderEditableInput(context, size);
    else
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: size.width,
        child: FlatButton(
          onPressed: toggleEdit,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                inputLabel,
                style: TextStyle(fontSize: 20.0, fontFamily: "CreteRound"),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(value, style: TextStyle(fontFamily: "Comfortaa")),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                        screenName == "profile"
                            ? Icons.mode_edit
                            : Icons.arrow_right,
                        size: 20),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Divider(color: Colors.grey, thickness: 0.5, height: 0),
              ),
            ],
          ),
        ),
      );
  }
}
