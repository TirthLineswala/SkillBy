import 'package:firebase_test/q-a%20screen/q-a.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class quu2 extends StatefulWidget {
  const quu2({super.key});

  @override
  State<quu2> createState() => _quu2State();
}

class _quu2State extends State<quu2> {
  String? selectedOption;
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Center(
              child: Container(
                width: 150,
                height: 150,
                child: Lottie.asset(
                  'assets/lottie/l2.json', 
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 80),

            Text(
              "Select Your Field",
              style: TextStyle(
                color: c1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            buildRadioButton(
              "Medical",
            ),
            buildRadioButton("Engineering"),

            SizedBox(height: 20),

            /// Show message conditionally based on selection
            if (selectedOption == "Medical")
              Text(
                "You selected Medical!",
                style: TextStyle(color: c4, fontSize: 16),
              ),
            if (selectedOption == "Engineering")
              Text(
                "You selected Engineering!",
                style: TextStyle(color: c4, fontSize: 16),
              ),

            SizedBox(height: 20),

            /// Next Button
            InkWell(
              onTap: () {
                if (selectedOption != null) {
                  if (selectedOption == "Medical") {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => First(),
                    //     ));
                  } else if (selectedOption == "Engineering") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => quu(),
                        ));
                  }
                } else {
                  // Show a warning if nothing is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Please select a field first!",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: c5,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Container(
                width: w / 1.1,
                height: 45,
                decoration: BoxDecoration(
                  color: c2,
                  borderRadius: BorderRadius.circular(
                      1), // Increased radius for better UI
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Custom Radio Button Widget
  Widget buildRadioButton(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: c1, fontSize: 16),
      ),
      leading: Radio<String>(
        value: title,
        groupValue: selectedOption,
        activeColor: c2,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
        },
      ),
    );
  }
}
