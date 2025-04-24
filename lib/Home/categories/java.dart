import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class JavaRoadmapScreen extends StatefulWidget {
  @override
  _JavaRoadmapScreenState createState() => _JavaRoadmapScreenState();
}

class _JavaRoadmapScreenState extends State<JavaRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Introduction to Java & Installation",
      "description": "Learn how to set up Java and understand its basics.",
      "icon": Icons.play_arrow,
      "completed": false,
    },
    {
      "title": "Basic Syntax & Data Types",
      "description": "Understand variables, data types, and syntax in Java.",
      "icon": Icons.code,
      "completed": false,
    },
    {
      "title": "OOP Concepts in Java",
      "description": "Master classes, objects, and key OOP principles.",
      "icon": Icons.view_module,
      "completed": false,
    },
    {
      "title": "Exception Handling & Debugging",
      "description":
          "Handle errors efficiently using try-catch and debugging tools.",
      "icon": Icons.bug_report,
      "completed": false,
    },
    {
      "title": "Collections Framework (Lists, Sets, Maps)",
      "description": "Learn data structures in Java and how to use them.",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "Multithreading & Concurrency",
      "description": "Understand how to work with threads in Java.",
      "icon": Icons.multiple_stop,
      "completed": false,
    },
    {
      "title": "Working with Databases (JDBC, Hibernate)",
      "description": "Learn how Java interacts with databases.",
      "icon": Icons.alarm,
      "completed": false,
    },
    {
      "title": "Spring Boot & Microservices",
      "description": "Build REST APIs and microservices using Spring Boot.",
      "icon": Icons.cloud,
      "completed": false,
    },
    {
      "title": "Security & Authentication",
      "description": "Learn about JWT, OAuth, and securing Java applications.",
      "icon": Icons.security,
      "completed": false,
    },
    {
      "title": "Performance Optimization & JVM Tuning",
      "description": "Optimize Java apps and improve efficiency.",
      "icon": Icons.speed,
      "completed": false,
    },
    {
      "title": "Deploying Java Applications",
      "description": "Learn about Docker, Kubernetes, and cloud deployment.",
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
        title: Text("Java Course Roadmap"),
        backgroundColor: Colors.deepOrange,
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
                  Image.asset("assets/images/java.png", height: 150),
                  SizedBox(height: 10),
                  Text(
                    "Java Learning Path ☕",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Master Java from Basics to Advanced Level!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Progress Bar
            Text(
              "Progress: $completed / $total Steps Completed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              color: Colors.deepOrange,
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
                            ? Colors.deepOrange
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
                            ? Colors.deepOrange
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
        content: Text("Enrolled in Java Learning Path! ☕"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'Java',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Colors.deepOrange,
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
