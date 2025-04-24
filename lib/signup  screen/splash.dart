import 'dart:async';

import 'package:firebase_test/signup%20%20screen/login.dart';
import 'package:firebase_test/signup%20%20screen/screen1.dart';
import 'package:firebase_test/signup%20%20screen/googlewithsignin.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Screen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: c1,
            image:
                DecorationImage(image: AssetImage("assets/images/logo.png"))),
      )),
    );
  }
}
