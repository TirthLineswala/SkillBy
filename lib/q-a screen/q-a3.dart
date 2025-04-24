import 'package:firebase_test/q-a%20screen/q-a1.dart';
import 'package:flutter/material.dart';

class quu3 extends StatefulWidget {
  @override
  State<quu3> createState() => _quu3State();
}

class _quu3State extends State<quu3> {
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark theme background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: c1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Save & exit",
                style: TextStyle(color: c1),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Which Occupation are you learning for?",
              style: TextStyle(
                color: c1,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "We’ll do our best to bring you relevant recommendations.",
              style: TextStyle(
                color: c2,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "My occupation",
              style: TextStyle(
                color: c1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: c1),
              decoration: InputDecoration(
                hintText: "Enter title",
                hintStyle: TextStyle(color: c1),
                filled: true,
                // fillColor: c2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => quu1()));
              },
              child: Text(
                "Back to list of occupations",
                style: TextStyle(
                  color: c1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(), // Pushes buttons to bottom
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => quu1()));
                  },
                  child: Container(
                    width: 170,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white, border: Border.all(color: c1)),
                    child: Center(
                      child: Text("Back",
                          style: TextStyle(
                              color: c1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
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
    );
  }
}
