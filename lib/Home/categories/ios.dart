import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class IOSroadmap extends StatefulWidget {
  @override
  _IOSroadmapState createState() => _IOSroadmapState();
}

class _IOSroadmapState extends State<IOSroadmap> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Swift Fundamentals",
      "description": "Master the basics of Swift programming language.",
      "icon": Icons.code,
      "completed": false,
    },
    {
      "title": "Xcode & Interface Builder",
      "description":
          "Learn to use Xcode and build UIs visually with Storyboards.",
      "icon": Icons.desktop_mac,
      "completed": false,
    },
    {
      "title": "SwiftUI Basics",
      "description": "Build declarative UIs using SwiftUI.",
      "icon": Icons.view_quilt,
      "completed": false,
    },
    {
      "title": "State Management & Navigation",
      "description": "Manage app state and navigate between views in SwiftUI.",
      "icon": Icons.compare_arrows,
      "completed": false,
    },
    {
      "title": "Networking & API Integration",
      "description": "Fetch data using URLSession and display API results.",
      "icon": Icons.network_check,
      "completed": false,
    },
    {
      "title": "Core Data & Persistence",
      "description":
          "Store and retrieve data locally using Core Data and UserDefaults.",
      "icon": Icons.save,
      "completed": false,
    },
    {
      "title": "Notifications & Background Tasks",
      "description":
          "Implement push/local notifications and background operations.",
      "icon": Icons.notifications_active,
      "completed": false,
    },
    {
      "title": "Testing & App Store Deployment",
      "description": "Test, debug, and deploy apps to the App Store.",
      "icon": Icons.cloud_upload,
      "completed": false,
    },
  ];

  int getCompletedSteps() {
    return roadmapSteps.where((step) => step['completed']).length;
  }

  @override
  Widget build(BuildContext context) {
    int completed = getCompletedSteps();
    int total = roadmapSteps.length;
    double progress = completed / total;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IT Roadmap",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Colors.grey), // This changes the back button color
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  Text(
                    "iOS Development Learning Path 📱",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Start your journey in iOS with this roadmap!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Progress Section
            Text(
              "Progress: $completed / $total Steps Completed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              color: Colors.black,
            ),
            SizedBox(height: 20),

            // Roadmap Steps
            Expanded(
              child: ListView.builder(
                itemCount: roadmapSteps.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        roadmapSteps[index]['icon'],
                        size: 32,
                        color: roadmapSteps[index]['completed']
                            ? Colors.black
                            : Colors.grey,
                      ),
                      title: Text(
                        roadmapSteps[index]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(roadmapSteps[index]['description']),
                      trailing: Icon(
                        roadmapSteps[index]['completed']
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: roadmapSteps[index]['completed']
                            ? Colors.black
                            : Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          roadmapSteps[index]['completed'] =
                              !roadmapSteps[index]['completed'];
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // Enroll Button
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Enrolled in iOS Learning Path!"),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopularCoursesScreen(
                      selectedCategory: 'IOS',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.black,
              ),
              child: Center(
                child: Text(
                  "Start Learning Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
