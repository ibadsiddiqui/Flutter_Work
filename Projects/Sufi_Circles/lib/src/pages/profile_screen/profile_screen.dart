import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sufi_Circles/src/models/user/UserModel.dart';
import 'package:Sufi_Circles/src/widgets/profile/user_detail_item.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: "Upload Profile Picture",
          onPressed: () {},
          child: Icon(Icons.add_a_photo)),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: size.height * 0.35,
              pinned: true,
              backgroundColor: Color(0xFF072247),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Ibad siddiqui",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "CreteRound",
                  ),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Text(
              "Profile Information",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontFamily: "CreteRound"),
            ),
            SizedBox(height: 20),
            Container(
              height: size.height * 0.12,
              child:
                  UserDetailItem(label: "Full Name:", value: "Ibad Siddiqui"),
            ),
            Container(
              height: size.height * 0.12,
              child: UserDetailItem(label: "Email:", value: userModel.email),
            ),
            Container(
              height: size.height * 0.12,
              child:
                  UserDetailItem(label: "Country:", value: userModel.country),
            ),
            Container(
              height: size.height * 0.12,
              child: UserDetailItem(label: "City:", value: userModel.city),
            ),
            // SizedBox(height: size.height * 0.4),
          ],
        ),
      ),
    );
  }
}
