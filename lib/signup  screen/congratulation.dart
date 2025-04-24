import 'package:firebase_test/Home/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CongratulationsScreen extends StatefulWidget {
  @override
  _CongratulationsScreenState createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to Home Screen after a delay
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5), // Dark overlay
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/person.jpg'),
                    )),
              ),

              SizedBox(height: 16),

              // Congratulations Text
              Text(
                "Congratulations",
                style: TextStyle(
                  color: c1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              // Description Text
              Text(
                "Your Account is Ready to Use. You will be redirected to the Home Page in a Few Seconds.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: c2.withOpacity(0.5)),
              ),

              SizedBox(height: 20),

              // Loading Indicator
              CircularProgressIndicator(
                color: c2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
