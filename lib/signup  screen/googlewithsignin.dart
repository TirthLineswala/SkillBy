import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/GoogleAuthService.dart';
import 'package:firebase_test/Home/home.dart';
import 'package:firebase_test/q-a%20screen/q-a2.dart';
import 'package:firebase_test/signup%20%20screen/login.dart';
import 'package:firebase_test/signup%20%20screen/signup.dart';
import 'package:flutter/material.dart';

class Googlewithsignin extends StatefulWidget {
  const Googlewithsignin({super.key});

  @override
  State<Googlewithsignin> createState() => _GooglewithsigninState();
}

class _GooglewithsigninState extends State<Googlewithsignin> {
  final GoogleAuthService _googleAuthService = GoogleAuthService();
  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      User? user = await _googleAuthService.signInWithGoogle();

      if (user != null) {
        // Store user details in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'photoURL': user.photoURL ?? '',
          'createdAt': Timestamp.now(),
        }, SetOptions(merge: true));

        // Navigate to home screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google Sign-In Successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In Failed: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/signup.jpg'))),
            ),
            SizedBox(height: 50),
            Text(
              "Let's you in",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 25),

            // Google Sign-In Button
            InkWell(
              onTap: _isLoading ? null : _signInWithGoogle,
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/g2.webp', width: 30, height: 30),
                    SizedBox(width: 12),
                    Text(
                      _isLoading ? "Signing in..." : "Continue with Google",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),
            Text("( Or )", style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 25),

            // Sign-In Button
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: c2,
              ),
              child: Row(
                children: [
                  SizedBox(width: 25),
                  Text(
                    "Sign In with Your Account",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, size: 30, color: c2),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),

            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(color: c1.withOpacity(0.6))),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: c2,
                      decoration: TextDecoration.underline,
                      decorationColor: c1,
                    ),
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
