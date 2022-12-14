import 'package:flutter/material.dart';
import 'package:softarchfinal/screen/home.dart';
import 'package:softarchfinal/screen/postapprove.dart';
import 'package:softarchfinal/screen/postreport.dart';
import 'package:softarchfinal/screen/tagdisplay.dart';
import 'package:softarchfinal/screen/userreport.dart';
import 'package:softarchfinal/screen/userverified.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TagDisplayScreen());
  }
}
