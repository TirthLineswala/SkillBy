import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/Home/bookmark.dart';
import 'package:firebase_test/Home/categories/dev.dart';
import 'package:firebase_test/Home/category.dart';
import 'package:firebase_test/Home/home.dart';
import 'package:firebase_test/Home/search.dart';
import 'package:firebase_test/firebase_options.dart';
import 'package:firebase_test/Home/popular.dart';
import 'package:firebase_test/q-a%20screen/q-a.dart';
import 'package:firebase_test/q-a%20screen/q-a2.dart';
import 'package:firebase_test/signup%20%20screen/about.dart';
import 'package:firebase_test/signup%20%20screen/congratulation.dart';
import 'package:firebase_test/signup%20%20screen/fingerprint.dart';
import 'package:firebase_test/signup%20%20screen/pin.dart';
import 'package:firebase_test/signup%20%20screen/screen1.dart';
import 'package:firebase_test/signup%20%20screen/signup.dart';
import 'package:firebase_test/signup%20%20screen/splash.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // print("Firebase connection is done!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
