import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w800, color: Colors.white),
            headline2: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      home: MyHomePage(),
    );
  }
}
