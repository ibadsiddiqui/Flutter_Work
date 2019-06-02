import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("Salam"),
//             Center(
//               child: FlatButton(
//                 child: Text("Press Me",textScaleFactor: 1.2,),
//                 onPressed: (){
//                   print("Salam");
//                 },
//               )
//             ) 
//           ]
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         body: Center(
           child: Text("Ibad here"),
         ),
       ) 
    );
  }
}