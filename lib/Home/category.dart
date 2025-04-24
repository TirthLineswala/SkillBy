import 'package:firebase_test/Home/categories/android.dart';
import 'package:firebase_test/Home/categories/dev.dart';
import 'package:firebase_test/Home/categories/full.dart';
import 'package:firebase_test/Home/categories/graphic.dart';
import 'package:firebase_test/Home/categories/ios.dart';
import 'package:firebase_test/Home/categories/it.dart';
import 'package:firebase_test/Home/categories/java.dart';
import 'package:firebase_test/Home/categories/ml.dart';
import 'package:firebase_test/Home/categories/net.dart';
import 'package:firebase_test/Home/categories/php.dart';
import 'package:firebase_test/Home/categories/python.dart';
import 'package:firebase_test/Home/categories/seo.dart';
import 'package:firebase_test/Home/categories/web.dart';
import 'package:flutter/material.dart';
import 'categories/software.dart';

class Category extends StatefulWidget {
   String? selectedCategory; 
   late final String? selectedCourse;
    Category({required this.selectedCourse}); 
  @override
  State<Category> createState() => _CategoryState();
}  
 class _CategoryState extends State<Category> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Software Development', 'icon': 'assets/images/software.png','screen': SoftwareDevelopmentRoadmapScreen()},
    {'name': 'Graphic Design', 'icon':'assets/images/graphic.png','screen': GraphicDesignRoadmapScreen()},
    {'name': 'Web Development', 'icon':'assets/images/web.png','screen': WebDevelopmentRoadmapScreen()},
    {'name': 'SEO & Marketing', 'icon':'assets/images/seo.png','screen': SeoMarketingRoadmapScreen()},
    {'name': 'Information Technology', 'icon': 'assets/images/IT.png','screen': ItRoadmapScreen()},
    {'name': 'Android', 'icon':'assets/images/android.png','screen': AndroidRoadmapScreen()},
    {'name': 'PHP', 'icon': 'assets/images/php.png','screen': PHPRoadmapScreen()},
    {'name': 'IOS', 'icon': 'assets/images/ios.png','screen': IOSroadmap()},
    {'name': 'Python', 'icon': 'assets/images/python.png','screen': PythonRoadmapScreen()},
    {'name': 'Java', 'icon': 'assets/images/java.png','screen': JavaRoadmapScreen()},
    {'name': 'DevOps', 'icon': 'assets/images/devops.png','screen': DevOpsRoadmapScreen()},
    {'name': '.Net', 'icon': 'assets/images/net.png','screen': DotNetRoadmapScreen()},
    {'name': 'Machine Learning', 'icon': 'assets/images/ml.png','screen': MachineLearningRoadmapScreen()},
    {'name': 'Full Stack', 'icon': 'assets/images/full.png','screen': FullStackRoadmapScreen()},
  ];
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: c1),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'All Categories',
          style: TextStyle(color: c1, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //! Navigate to corresponding course screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => categories[index]['screen']),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(categories[index]['icon'], height: 60),
                  SizedBox(height: 10),
                  Text(
                    categories[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, color: c1),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
