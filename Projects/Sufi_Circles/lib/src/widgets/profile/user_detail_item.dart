import 'package:flutter/material.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_details/edit_details_field.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_details/label.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_details/user_value.dart';

class UserDetailItem extends StatelessWidget {
  final bool isEditable;
  final String inputLabel;
  final String value;
  final Function toggleEdit;
  final Function onSubmit;

  const UserDetailItem({
    Key key,
    this.value = "",
    this.inputLabel,
    this.isEditable = false,
    this.toggleEdit,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isEditable)
      return EditDetailsField(
          label: inputLabel, onSubmit: onSubmit, edit: toggleEdit);
    else
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: size.width,
        child: FlatButton(
          onPressed: toggleEdit,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserDetailLabel(label: inputLabel),
              UserValue(value: value),
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
