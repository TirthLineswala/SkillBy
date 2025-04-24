import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class WebDevelopmentRoadmapScreen extends StatefulWidget {
  @override
  _WebDevelopmentRoadmapScreenState createState() =>
      _WebDevelopmentRoadmapScreenState();
}

class _WebDevelopmentRoadmapScreenState
    extends State<WebDevelopmentRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "HTML, CSS, and JavaScript Basics",
      "description": "Learn the foundation of web development.",
      "icon": Icons.web,
      "completed": true,
    },
    {
      "title": "Responsive Web Design",
      "description": "Master CSS Grid, Flexbox, and media queries.",
      "icon": Icons.phone_android,
      "completed": false,
    },
    {
      "title": "Version Control (Git & GitHub)",
      "description": "Understand Git commands and collaboration with GitHub.",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "Front-end Frameworks",
      "description": "Learn React, Vue, or Angular for modern web apps.",
      "icon": Icons.developer_mode,
      "completed": false,
    },
    {
      "title": "Backend Basics",
      "description": "Introduction to Node.js, Express, Django, or Flask.",
      "icon": Icons.cloud,
      "completed": false,
    },
    {
      "title": "Databases & APIs",
      "description": "SQL, MongoDB, Firebase & RESTful APIs.",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "Authentication & Security",
      "description": "Implement JWT, OAuth, and Firebase Auth.",
      "icon": Icons.security,
      "completed": false,
    },
    {
      "title": "DevOps & Deployment",
      "description": "Docker, CI/CD, AWS, and performance optimization.",
      "icon": Icons.cloud_upload,
      "completed": false,
    },
  ];

  int getCompletedSteps() {
    return roadmapSteps.where((step) => step['completed']).length;
  }

  @override
  Widget build(BuildContext context) {
    int completedSteps = getCompletedSteps();
    int totalSteps = roadmapSteps.length;
    double progress = completedSteps / totalSteps;

    return Scaffold(
      appBar: AppBar(
        title: Text("Web Development Roadmap"),
        backgroundColor: const Color.fromARGB(255, 96, 87, 210),
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
                    "Web Development Learning Path 🌐",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Start with the basics and become a Full Stack Web Developer!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Progress Bar
            Text(
              "Progress: $completedSteps / $totalSteps Steps Completed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Color.fromARGB(255, 86, 78, 193),
              minHeight: 8,
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
                            ? Color.fromARGB(255, 86, 78, 193)
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
                            ? Color.fromARGB(255, 86, 78, 193)
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

            // Start Learning Button
            SizedBox(height: 10),
          ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Enrolled in Web Development Learning Path! 🚀"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'Web Development',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Color.fromARGB(255, 96, 87, 210),
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
