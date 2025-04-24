import 'package:firebase_test/signup%20%20screen/login.dart';
import 'package:firebase_test/q-a%20screen/q-a.dart';
import 'package:firebase_test/q-a%20screen/q-a3.dart';
import 'package:flutter/material.dart';

class quu1 extends StatefulWidget {
  @override
  _quu1State createState() => _quu1State();
}

class _quu1State extends State<quu1> {
  String? selectedField;
  String? managingPeople;

  bool showMore = false;

  final List<String> allFields1 = [
    "Mobile Application Developer",
    "PHP Developer",
    "Python Developer",
    "Software Architect",
    "Software Developer",
    "Software Quality Assurance Engineer",
    "Software Tester",
    "Web Developer",
    "WordPress Developer",
    "Data Engineer",
    "Machine Learning Engineer",
    ".NET Developer",
    "Android Developer",
    "Back End Web Developer",
    "DevOps Engineer",
    "Front End Web Developer",
    "Full Stack Web Developer",
    "Game Developer",
    "iOS Developer",
    "Java Developer",
    "JavaScript Developer",
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
                  context, MaterialPageRoute(builder: (context) => quu()));
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
              /// Question: What field are you learning for?
              Text(
                "Which Occupation are you learning for?",
                style: TextStyle(
                    fontFamily: 'Fontmain',
                    color: c1,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              Text(
                "Software Development occupations",
                style: TextStyle(
                    color: c1, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

              /// Radio Button List for Fields
              ...allFields1
                  .sublist(0, showMore ? allFields1.length : allFields1.length)
                  .map((field) => buildRadioButton(field))
                  .toList(),

              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => quu3()));
                },
                child: Text("I can't find my occupation",
                    style: TextStyle(color: c3)),
              ),

              /// Next Button
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => quu()));
                    },
                    child: Container(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all(color: c2)),
                      child: Center(
                        child: Text("Back",
                            style: TextStyle(
                                color: c2,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 170,
                    height: 45,
                    color: c2,
                    child: Center(
                      child: Text("Start Learning",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
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
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: c3),
        borderRadius: BorderRadius.circular(1),
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
