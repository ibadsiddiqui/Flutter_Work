import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF072247),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                // color: Colors.red,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/icons/app icon/app_icon.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    repeat: ImageRepeat.noRepeat,
                  ),
                ),
                constraints: BoxConstraints.expand(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  // child: Image.asset("asset/icons/app icon/app_icon.png"),
                ),
              ),
            ),
            Text("ibasd"),
          ],
        ),
      ),
    );
  }
}
