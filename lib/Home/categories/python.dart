import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class PythonRoadmapScreen extends StatefulWidget {
  @override
  _PythonRoadmapScreenState createState() => _PythonRoadmapScreenState();
}

class _PythonRoadmapScreenState extends State<PythonRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Introduction to Python & Installation",
      "description": "Learn the basics and set up your Python environment.",
      "icon": Icons.play_arrow,
      "completed": false,
    },
    {
      "title": "Basic Syntax & Data Types",
      "description": "Understand Python syntax, data types, and structures.",
      "icon": Icons.code,
      "completed": false,
    },
    {
      "title": "Conditional Statements & Loops",
      "description": "Master if-else statements, loops, and iteration.",
      "icon": Icons.loop,
      "completed": false,
    },
    {
      "title": "Functions & Modules",
      "description":
          "Learn how to write reusable functions and import modules.",
      "icon": Icons.functions,
      "completed": false,
    },
    {
      "title": "Working with Libraries (NumPy, Pandas, Matplotlib)",
      "description":
          "Use Python libraries for data analysis and visualization.",
      "icon": Icons.analytics,
      "completed": false,
    },
    {
      "title": "Web Scraping with BeautifulSoup & Selenium",
      "description": "Extract data from websites using Python.",
      "icon": Icons.web,
      "completed": false,
    },
    {
      "title": "Machine Learning with Scikit-Learn & TensorFlow",
      "description": "Understand ML concepts and build models.",
      "icon": Icons.computer,
      "completed": false,
    },
    {
      "title": "Django & Flask for Web Development",
      "description": "Develop full-stack web applications with Python.",
      "icon": Icons.web,
      "completed": false,
    },
    {
      "title": "Cybersecurity & Ethical Hacking",
      "description": "Learn how Python is used in cybersecurity.",
      "icon": Icons.security,
      "completed": false,
    },
    {
      "title": "Deploying Python Applications (AWS, Docker, Kubernetes)",
      "description": "Host and deploy Python apps on the cloud.",
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
        title: Text("Python"),
        backgroundColor: Colors.blueAccent,
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
                    "Python Learning Path 🐍",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Master Python from Basics to Advanced Level!",
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
              color: Colors.blueAccent,
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
                            ? Colors.blueAccent
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
                            ? Colors.blueAccent
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
        content: Text("Enrolled in Python Learning Path! 🐍"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'Python',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Colors.blueAccent,
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
