import 'package:firebase_test/Home/home.dart';
import 'package:firebase_test/signup%20%20screen/googlewithsignin.dart';
import 'package:firebase_test/signup%20%20screen/signup.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false; // Checkbox state

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful!")),
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                height: 30,
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Login to continue your",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: c1),
                              ),
                              Text(
                                "learning journey",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: c1),
                              ),
                              SizedBox(height: 20),

                              // Email Field
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                        borderSide: BorderSide(color: c1)),
                                    errorStyle: TextStyle(color: c1),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                        borderSide: BorderSide(color: c1)),
                                    errorStyle: TextStyle(color: c1),
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
                              SizedBox(height: 10),

                              // Remember Me & Forgot Password
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value!;
                                            });
                                          },
                                          activeColor: c2,
                                        ),
                                        Text("Remember Me",
                                            style: TextStyle(color: c1)),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          color: c2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 15),

                              // Login Button
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: w,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: c2,
                                      borderRadius: BorderRadius.circular(1)),
                                  child: InkWell(
                                    onTap: () {
                                      _login;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ));
                                    },
                                    child: Center(
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 15),

                              // Sign-up Navigation
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                      style: TextStyle(
                                          color: c1.withOpacity(0.6))),
                                  SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()),
                                      );
                                    },
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: c2,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
