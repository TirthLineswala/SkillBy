import 'dart:async';
import 'package:firebase_test/Home/ai.dart';
import 'package:firebase_test/Home/app.dart';
import 'package:firebase_test/Home/category.dart';
import 'package:firebase_test/Home/filter.dart';
import 'package:firebase_test/Home/graphic.dart';
import 'package:firebase_test/Home/mentor.dart';
import 'package:firebase_test/Home/popular.dart';
import 'package:firebase_test/Home/popularin.dart';
import 'package:firebase_test/taste.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
   String? selectedCategory; 
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCourse;
    String? selectedCategory;
    

  List<String> courses = [
    "Software Development",
    "Marketing",
    "Graphic Design",
    "Information Technology",
    "IOS ",
    "PHP",
    "Python",
    "Java",
        "Android",
    "DevOps",
    ".Net",
    "Machine Learning",
    "Full Stack",
  ];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _userName = "User";
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Category selection state
  int _selectedCategoryIndex = 0;

  // Sample category list
  final List<String> _categories = [
    "Software Development",
    " Marketing",
    "Graphic Design",
    "Information Technology",
    "IOS ",
    "PHP",
    "Python",
    "Java",
    "Android",
    "DevOps",
    ".Net",
    "Machine Learning",
    "Full Stack",
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserName();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % 3;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<void> _fetchUserName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _userName = userDoc['name'] ?? "User";
        });
      }
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, $_userName",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: c1)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("What would you like to learn today?",
                        style: TextStyle(
                            fontSize: 12, color: c2.withOpacity(0.7))),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilterScreen(),
                            ));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bell.png'))),
                      ),
                    )
                  ],
                ),
                Text("Search Below.",
                    style: TextStyle(fontSize: 14, color: c2.withOpacity(0.7))),
                SizedBox(height: 40),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c3, width: 2),
                    ),
                    labelText: "Select a Course",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  dropdownColor: Colors.blueGrey[50],
                  value: selectedCourse,
                  hint: Text("Choose your course"),
                  items: courses.asMap().entries.map((entry) {
                    int index = entry.key;
                    String course = entry.value;

                    return DropdownMenuItem(
                      value: course,
                      child: Text(
                        course,
                        style: TextStyle(
                          color: c1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                 onChanged: (String? newValue) {
  setState(() {
    selectedCategory = newValue!;  // Save the selected value
  });
  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Category(selectedCourse: '',)// Pass the selected course here
  ),
);

}

                ),

                SizedBox(height: 20),
                SizedBox(
                  height: 170,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DiscountBanner(
                            title: "25% OFF*\nToday's Special",
                            description:
                                "Get a Discount for Every\nCourse Order only Valid for \nToday!",
                            color: Colors.orange.withOpacity(0.7)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DiscountBanner(
                            title: "75% OFF*\nLimited Time Offer!",
                            description:
                                "Hurry Up!\nGet an Extra\n75% Discount Today!",
                            color: Colors.green.withOpacity(0.8)),
                      ),
                      DiscountBanner(
                          title: "Hurry Up!\nFlash Sale 25% OFF!",
                          description:
                              "Only a Few Hours Left!\nGrab Your Discount Now!",
                          color: Colors.purple.withOpacity(0.7)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17, color: c1),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "SEE ALL",
                            style: TextStyle(
                                color: c2, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: c2,
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Category(selectedCourse: '',),
                            ));
                      },
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                          });
                        },
                        child: CategoryChip(
                          label: _categories[index],
                          selected: _selectedCategoryIndex == index,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Courses  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17, color: c1),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "SEE ALL",
                            style: TextStyle(
                                color: c2, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: c2,
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PopularCoursesScreen(
                                selectedCategory: '',
                              ),
                            ));
                      },
                    )
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Black Screen (Video Placeholder)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Graphic()));
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/graphic.jpg')),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Category Label
                                    Text(
                                      "Graphic Design",
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Course Title
                                    Text(
                                      "Graphic Design Advanced",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        // Price
                                        Text(
                                          "\$28  ",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Text("|"),
                                        SizedBox(width: 3),

                                        // Rating
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          "4.2",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(width: 10),
                                        Text("|"),
                                        SizedBox(width: 5),

                                        // Students
                                        Text(
                                          "7830 Std",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => App()));
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Black Screen (Video Placeholder)
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/app.jpg')),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Category Label
                                      Text(
                                        "Application Development",
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Course Title
                                      Text(
                                        "Application Development Advanced",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          // Price
                                          Text(
                                            "\$35",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text("|"),
                                          SizedBox(width: 5),

                                          // Rating
                                          Icon(Icons.star,
                                              color: Colors.orange, size: 16),
                                          SizedBox(width: 4),
                                          Text(
                                            "4.5",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          SizedBox(width: 10),
                                          Text("|"),
                                          SizedBox(width: 5),

                                          // Students
                                          Text(
                                            "6254 Std",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Ai()));
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Black Screen (Video Placeholder)
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/ai.jpg')),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Category Label
                                    Text(
                                      "Artificial Intelligence",
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Course Title
                                    Text(
                                      "Artificial Intelligence Advanced",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        // Price
                                        Text(
                                          "\$38",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text("|"),
                                        SizedBox(width: 5),

                                        // Rating
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(width: 10),
                                        Text("|"),
                                        SizedBox(width: 5),

                                        // Students
                                        Text(
                                          "8564 Std",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Mentor",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17, color: c1),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "SEE ALL",
                            style: TextStyle(
                                color: c2, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: c2,
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MentorSearchScreen(),
                            ));
                      },
                    )
                  ],
                ),
                SizedBox(height: 10),
                // List of mentors with different names
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MentorAvatar(
                          name: "John Doe",
                          imageUrl:
                              "https://randomuser.me/api/portraits/men/62.jpg"),
                      SizedBox(
                        width: 10,
                      ),
                      MentorAvatar(
                          name: "Sarah Lee",
                          imageUrl:
                              "https://randomuser.me/api/portraits/women/2.jpg"),
                      SizedBox(
                        width: 10,
                      ),
                      MentorAvatar(
                          name: "Michael Smith",
                          imageUrl:
                              "https://randomuser.me/api/portraits/men/3.jpg"),
                      SizedBox(
                        width: 10,
                      ),
                      MentorAvatar(
                          name: "Emma Johnson",
                          imageUrl:
                              "https://randomuser.me/api/portraits/women/4.jpg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Components
class DiscountBanner extends StatelessWidget {
  final String title, description;
  final Color color;
  DiscountBanner(
      {required this.title, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(description,
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);

  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);
  final String label;
  final bool selected;

  CategoryChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: selected ? Colors.white : Colors.black54),
        ),
        backgroundColor: selected ? c2 : c5.withOpacity(0.4),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title, price;
  final double rating;
  final int students;
  CourseCard(
      {required this.title,
      required this.price,
      required this.rating,
      required this.students});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(price,
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(children: [
            Icon(Icons.star, color: Colors.yellow, size: 16),
            Text(" $rating | $students Std")
          ]),
        ],
      ),
    );
  }
}

class MentorAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;
  MentorAvatar({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 5),
      Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
    ]);
  }
}
