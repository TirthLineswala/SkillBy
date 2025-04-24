import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class PHPRoadmapScreen extends StatefulWidget {
  @override
  _PHPRoadmapScreenState createState() => _PHPRoadmapScreenState();
}

class _PHPRoadmapScreenState extends State<PHPRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Introduction to PHP & Server-side Scripting",
      "description": "Learn how PHP works in web development.",
      "icon": Icons.code,
      "completed": false,
    },
    {
      "title": "Setting Up XAMPP / LAMP & Localhost",
      "description": "Install and configure PHP development environment.",
      "icon": Icons.settings,
      "completed": false,
    },
    {
      "title": "Basic Syntax & Variables in PHP",
      "description": "Understand PHP syntax and how variables work.",
      "icon": Icons.text_fields,
      "completed": false,
    },
    {
      "title": "Control Structures: Loops & Conditionals",
      "description": "Master loops (for, while) and conditionals (if-else).",
      "icon": Icons.loop,
      "completed": false,
    },
    {
      "title": "Connecting PHP with MySQL Database",
      "description": "Learn how to connect PHP to MySQL databases.",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "User Authentication & Sessions",
      "description": "Implement login, registration, and session handling.",
      "icon": Icons.lock,
      "completed": false,
    },
    {
      "title": "Building RESTful APIs with PHP",
      "description": "Develop scalable REST APIs using PHP.",
      "icon": Icons.api,
      "completed": false,
    },
    {
      "title": "Working with PHP Frameworks (Laravel, CodeIgniter)",
      "description": "Learn how to use Laravel and CodeIgniter.",
      "icon": Icons.web,
      "completed": false,
    },
    {
      "title": "Deploying PHP Applications",
      "description": "Deploy PHP applications on cPanel, Cloud, or Docker.",
      "icon": Icons.cloud_upload,
      "completed": false,
    },
    {
      "title": "Unit Testing & CI/CD Pipelines in PHP",
      "description": "Implement automated testing and CI/CD workflows.",
      "icon": Icons.bug_report,
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
        title: Text("PHP Development Roadmap"),
        backgroundColor: Colors.blue[900],
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
                    "PHP Development Learning Path 🐘",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Learn PHP from scratch to advanced level!",
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
              color: Colors.blue[800],
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
                            ? Colors.blue[900]
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
                            ? Colors.blue[900]
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
        content: Text("Enrolled in PHP Learning Path! 🐘"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'PHP',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Colors.blue[900],
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
