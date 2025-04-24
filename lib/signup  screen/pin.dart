import 'package:firebase_test/signup%20%20screen/fingerprint.dart';
import 'package:flutter/material.dart';

class Pin extends StatefulWidget {
  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {
  List<String> pin = ["", "", "", ""]; // Stores the PIN entered

  void _onKeyPressed(String value) {
    setState(() {
      for (int i = 0; i < pin.length; i++) {
        if (pin[i] == "") {
          pin[i] = value;
          break;
        }
      }
    });
  }

  void _onBackspace() {
    setState(() {
      for (int i = pin.length - 1; i >= 0; i--) {
        if (pin[i] != "") {
          pin[i] = "";
          break;
        }
      }
    });
  }

  bool get _isPinComplete => !pin.contains("");

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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 28, color: c1),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Create New Pin",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: c1),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),

            Center(
              child: Column(
                children: [
                  Text(
                    "Add a Pin Number to Make Your Account\nmore Secure",
                    style: TextStyle(
                        fontSize: 12,
                        color: c2.withOpacity(0.9),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // PIN Input Field
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: pin[index] != "" ? c3 : Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        pin[index].isEmpty ? "*" : pin[index],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 40),

            // Continue Button
            Center(
              child: SizedBox(
                width: w * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isPinComplete
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FingerprintScreen()));
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 5),

            // Numeric Keypad
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  String key = index < 9
                      ? (index + 1).toString()
                      : index == 9
                          ? "*"
                          : index == 10
                              ? "0"
                              : "⌫";

                  return InkWell(
                    onTap: () {
                      if (key == "⌫") {
                        _onBackspace();
                      } else if (pin.contains("") && key != "*") {
                        _onKeyPressed(key);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: c5.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Text(
                          key,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
