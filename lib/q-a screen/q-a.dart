import 'package:firebase_test/q-a%20screen/q-a2.dart';
import 'package:firebase_test/signup%20%20screen/login.dart';
import 'package:firebase_test/q-a%20screen/q-a1.dart';
import 'package:flutter/material.dart';

class quu extends StatefulWidget {
  @override
  _quuState createState() => _quuState();
}

class _quuState extends State<quu> {
  String? selectedField;
  String? managingPeople;

  bool showMore = false;

  final List<String> allFields = [
    "Software Development",
    "Data & Analytics",
    "Information Technology",
    "Marketing",
    "Design",
    "Finance & Accounting",
    "Product & Project Management",
    "Business Operations",
    "Sales & Business Development",
    "Human Resources",
    "Education & Training",
    "Customer Support",
    "Health & Wellness",
    "Writing",
    "Legal",
    "Art",
    "None of the above"
  ];

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => quu2()));
            },
            child: Icon(Icons.arrow_back, color: c1)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => login()));
            },
            child: Text("Save & exit", style: TextStyle(color: c1)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Notification Banner
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: c2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.amber),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Answer a few questions to improve your content recommendations",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Question: What field are you learning for?
              Text(
                "What field are you learning for?",
                style: TextStyle(
                    fontFamily: 'Fontmain',
                    color: c1,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              /// Radio Button List for Fields
              ...allFields
                  .sublist(0, showMore ? allFields.length : 4)
                  .map((field) => buildRadioButton(field))
                  .toList(),

              /// Show More Button
              if (!showMore)
                TextButton(
                  onPressed: () {
                    setState(() {
                      showMore = true;
                    });
                  },
                  child: Text("Show more", style: TextStyle(color: c3)),
                ),

              SizedBox(height: 20),

              /// Question: Do you currently manage people?
              Text(
                "Do you currently manage people?",
                style: TextStyle(
                    color: c1, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              /// Radio Buttons for Managing People
              buildRadioButton("Yes", isManagingPeople: true),
              buildRadioButton("No", isManagingPeople: true),

              SizedBox(height: 10),

              /// Next Button
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => quu1()));
                },
                child: Container(
                  width: w / 1.1,
                  height: 45,
                  color: c2,
                  child: Center(
                    child: Text("Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable Radio Button
  Widget buildRadioButton(String title, {bool isManagingPeople = false}) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: c3),
        borderRadius: BorderRadius.circular(0.2),
      ),
      child: RadioListTile<String>(
        title: Text(title,
            style: TextStyle(color: c2, fontWeight: FontWeight.bold)),
        value: title,
        groupValue: isManagingPeople ? managingPeople : selectedField,
        activeColor: c2,
        onChanged: (value) {
          setState(() {
            if (isManagingPeople) {
              managingPeople = value;
            } else {
              selectedField = value;
            }
          });
        },
      ),
    );
  }
}
