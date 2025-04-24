import 'package:firebase_test/Home/home.dart';
import 'package:firebase_test/signup%20%20screen/congratulation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintScreen extends StatefulWidget {
  @override
  _FingerprintScreenState createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;
  String _authStatus = "Not Authenticated";

  Future<void> _authenticate() async {
    bool authenticated = false;
    setState(() {
      _isAuthenticating = true;
    });

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true, // Keeps the authentication active
        ),
      );
    } catch (e) {
      print("Authentication Error: $e");
    }

    setState(() {
      _isAuthenticating = false;
      _authStatus = authenticated ? "Authenticated" : "Failed";
    });

    if (authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CongratulationsScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Authentication failed. Try again!")),
      );
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 28, color: c1),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Create New Pin",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: c1),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(height: 10),
            Text(
              "Add a Fingerprint to Make your Account more Secure",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: c2.withOpacity(0.8)),
            ),
            SizedBox(height: 40),

            // Fingerprint Scanner Icon
            Center(
              child: GestureDetector(
                onTap: _isAuthenticating ? null : _authenticate,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _isAuthenticating ? 0.5 : 1.0,
                  child: Image.asset(
                    'assets/images/fingerprint.png',
                    width: 120,
                    height: 120,
                    color: _isAuthenticating ? Colors.grey : c5,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
            Text(
              "Please Put Your Finger on the Scanner to get Started.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: c2.withOpacity(0.8)),
            ),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: c5.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(fontSize: 16, color: c2),
                      ),
                    ),
                  ),
                ),

                // Continue Button
                ElevatedButton(
                  onPressed: _isAuthenticating ? null : _authenticate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c2.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text("Continue",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
