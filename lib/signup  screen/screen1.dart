import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_test/signup%20%20screen/googlewithsignin.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _currentIndex = 0;

  // Titles for each screen
  final List<String> titles = [
    "Online Learning",
    "Learn from Anywhere",
    "Get Online Certificate"
  ];

  final List<String> descriptions = [
    "We Provide Online Classes and Pre Recorded\nLectures.!",
    "Book or Save the Lectures for Future",
    
    "Analyse your scores and Track your results"
  ];

  final List<String> lottieFiles = [
    "assets/lottie/l4.json",
    "assets/lottie/l5.json",
    "assets/lottie/l6.json"
  ];

  void _nextScreen() {
    if (_currentIndex < 2) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _previousScreen() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 200),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Googlewithsignin()),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Lottie Animation Instead of Image
              Lottie.asset(
                lottieFiles[_currentIndex],
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 30),

              Text(
                titles[_currentIndex],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Text(
                descriptions[_currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🔵 Dots Indicator
            Row(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: _currentIndex == index ? c2 : c5,
                  ),
                );
              }),
            ),

            // ▶️ Next Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: c2,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, size: 30, color: Colors.white),
                onPressed: _currentIndex == 2
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Googlewithsignin()),
                        );
                      }
                    : _nextScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
