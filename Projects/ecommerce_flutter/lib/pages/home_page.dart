import 'package:ecommerce_flutter/api/db_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DB_API = new DbAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Commerce"),
        ),
        body: ListView.builder(
          itemCount: DB_API.getCategories().length,
          itemBuilder: (context, int index) =>
              Text(DB_API.getCategories()[index].name),
        ));
  }
}
