import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/GoogleAuthService.dart';
import 'package:firebase_test/Home/home.dart';
import 'package:firebase_test/signup%20%20screen/about.dart';
import 'package:firebase_test/signup%20%20screen/login.dart';
import 'package:firebase_test/q-a%20screen/q-a.dart';
import 'package:firebase_test/q-a%20screen/q-a2.dart';
import 'package:firebase_test/signup%20%20screen/googlewithsignin.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;

  // Function to sign up user
  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      // Firebase Authentication: Create User
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      User? user = userCredential.user;

      // Firestore: Store user details
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup Successful!')),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Signup Failed')),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: h,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(1),
            child: Center(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 80),
                                child: Container(
                                  width: 65,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/vec1.png'))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  width: 70,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/vec2.png'))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Container(
                                  width: 65,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/vec3.png'))),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Getting Started.!",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: c1),
                          ),
                          Text(
                            "Create an Account to Continue your allCourses",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: c1),
                          ),
                          SizedBox(height: 20),

                          // Name Field
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              cursorColor: c1,
                              style: TextStyle(color: c1),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person, color: c5),
                                labelText: "Name",
                                labelStyle: TextStyle(color: c5),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your name'
                                  : null,
                            ),
                          ),
                          SizedBox(height: 20),

                          // Email Field
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: c1,
                              style: TextStyle(color: c1),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail, color: c5),
                                labelText: "Email",
                                labelStyle: TextStyle(color: c5),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 15),

                          // Password Field
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: c1,
                              style: TextStyle(color: c1),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock, color: c5),
                                labelText: "Password",
                                labelStyle: TextStyle(color: c5),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 20),

                          // Signup Button
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              width: w,
                              height: 45,
                              decoration: BoxDecoration(color: c2),
                              child: InkWell(
                                onTap: () async {
                                  if (_nameController.text.isEmpty ||
                                      _emailController.text.isEmpty ||
                                      _passwordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please fill in all fields',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        backgroundColor: c5,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    );
                                    return;
                                  }

                                  await _signup();

                                  if (!_isLoading) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Signup Successful!',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        backgroundColor: c3,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    );

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => About()),
                                     
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(color: c1.withOpacity(0.6)),
                                ),
                                SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login()),
                                    );
                                  },
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: c2,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
