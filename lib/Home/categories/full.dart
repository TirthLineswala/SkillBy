import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class FullStackRoadmapScreen extends StatefulWidget {
  @override
  _FullStackRoadmapScreenState createState() => _FullStackRoadmapScreenState();
}

class _FullStackRoadmapScreenState extends State<FullStackRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Frontend Development",
      "description": "Learn HTML, CSS, JavaScript, and frontend frameworks.",
      "icon": Icons.web,
      "completed": true,
    },
    {
      "title": "JavaScript Frameworks",
      "description": "Master React.js, Vue.js, or Angular for UI development.",
      "icon": Icons.code,
      "completed": false,
    },
    {
      "title": "Backend Development",
      "description":
          "Understand Node.js, Django, or Spring Boot for server-side logic.",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "RESTful APIs & Authentication",
      "description": "Implement APIs with JWT, OAuth, and GraphQL.",
      "icon": Icons.api,
      "completed": false,
    },
    {
      "title": "Database Management",
      "description":
          "Work with SQL (MySQL, PostgreSQL) & NoSQL (MongoDB, Firebase).",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "Version Control & CI/CD",
      "description": "Use Git, GitHub, GitLab, and CI/CD pipelines.",
      "icon": Icons.merge_type,
      "completed": false,
    },
    {
      "title": "DevOps & Deployment",
      "description":
          "Deploy projects on AWS, GCP, or Azure with Docker & Kubernetes.",
      "icon": Icons.cloud,
      "completed": false,
    },
    {
      "title": "Security & Performance Optimization",
      "description": "Enhance security and optimize full-stack applications.",
      "icon": Icons.security,
      "completed": false,
    },
    {
      "title": "Building Real-World Projects",
      "description": "Work on full-stack projects to build a strong portfolio.",
      "icon": Icons.build,
      "completed": false,
    },
  ];

  // Function to calculate the number of completed steps
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
        title: Text("Full Stack Developer Roadmap"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Overview
            Center(
              child: Column(
                children: [
                  Text(
                    "Full Stack Developer Roadmap 🌐",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Master Frontend, Backend & Deployment!",
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
              color: Colors.teal,
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
                            ? Colors.teal
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
                            ? Colors.teal
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
    // Show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Enrolled in Full Stack Developer Course!")),
    );
    // Navigate to PopularCoursesScreen with a category filter for Full Stack Development
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'Full Stack Development',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Colors.teal,
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
