// ignore_for_file: unused_import

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/screen/login.dart';
import 'package:softarchfinal/screen/register.dart';

class HomeScreen extends StatelessWidget {
  bool isAuth = false;

  Widget buildAuthScreen() {
    return Text('Auth');
  }

  Widget buildUnAuthScreen(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(233, 99, 23, 1)),
      child: Column(children: [
        SizedBox(
          height: (newheight / 4),
          width: screenWidth,
        ),
        const SizedBox(height: 10),
        const Text(
          "KMITL",
          style: TextStyle(
              fontSize: 35.34, color: Colors.white, fontFamily: "BanglaMN"),
          textAlign: TextAlign.center,
        ),
        const Text("NEWS", style: TextStyle(fontSize: 18, color: Colors.white)),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: const Size(256, 48),
            primary: const Color.fromRGBO(212, 17, 17, 1), // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RegisterScreen();
            }));
          },
          child: const Text(
            'SIGN UP FREE',
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              fixedSize: const Size(256, 48),
              primary: Colors.white,
              side: const BorderSide(width: 1, color: Colors.white)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
          child: const Text(
            'LOG IN',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen(context);
  }
}
