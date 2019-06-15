import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String str = "Salam, My Name is Ibad";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView.separated(
              itemBuilder: (context, int index) {
                return ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("Salam" + index.toString()),
                  onTap: () {
                    print(index);
                  },
                );
              },
              itemCount: 20,
              separatorBuilder: (context, index) {
                if ((index + 1) % 5 == 0) {
                  return ListTile(
                    title: Text((index + 1).toString()),
                    selected: true,
                  );
                } else {
                  return Container();
                }
              })),
    );
  }
}
