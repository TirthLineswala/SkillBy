import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class DevOpsRoadmapScreen extends StatefulWidget {
  @override
  _DevOpsRoadmapScreenState createState() => _DevOpsRoadmapScreenState();
}

class _DevOpsRoadmapScreenState extends State<DevOpsRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Understanding DevOps Principles",
      "description": "Learn about DevOps culture, Agile & automation.",
      "icon": Icons.auto_fix_high,
      "completed": true,
    },
    {
      "title": "Basic Linux & Shell Scripting",
      "description": "Master essential Linux commands and scripting.",
      "icon": Icons.terminal,
      "completed": false,
    },
    {
      "title": "Version Control with Git & GitHub",
      "description": "Learn Git basics, branching, and collaborative coding.",
      "icon": Icons.merge_type,
      "completed": false,
    },
    {
      "title": "Cloud Computing Basics",
      "description": "Understand AWS, Azure, GCP, and cloud deployment.",
      "icon": Icons.cloud,
      "completed": false,
    },
    {
      "title": "Containerization with Docker",
      "description": "Create, manage, and deploy containers using Docker.",
      "icon": Icons.apps,
      "completed": false,
    },
    {
      "title": "Kubernetes & Orchestration",
      "description": "Deploy, scale, and manage applications using Kubernetes.",
      "icon": Icons.view_comfy,
      "completed": false,
    },
    {
      "title": "Infrastructure as Code",
      "description": "Use Terraform & Ansible to automate infrastructure.",
      "icon": Icons.build,
      "completed": false,
    },
    {
      "title": "CI/CD Pipelines",
      "description":
          "Set up Continuous Integration & Deployment with Jenkins, GitHub Actions.",
      "icon": Icons.sync,
      "completed": false,
    },
    {
      "title": "Monitoring & Logging",
      "description": "Use Prometheus, Grafana, and ELK stack for monitoring.",
      "icon": Icons.analytics,
      "completed": false,
    },
    {
      "title": "Advanced DevOps & SRE",
      "description":
          "Learn Hybrid & Multi-cloud, Security, and SRE best practices.",
      "icon": Icons.security,
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
          "DevOps",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 74, 177, 74),
        iconTheme:
            IconThemeData(color: Colors.black), // This makes AppBar icons grey
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Overview
            Text(
              "Your Path to Becoming a DevOps Engineer",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Follow this structured roadmap to master DevOps step by step.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
              color: Color.fromARGB(255, 72, 186, 72),
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
                            ? Color.fromARGB(255, 74, 177, 74)
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
                            ? Color.fromARGB(255, 74, 177, 74)
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
      SnackBar(content: Text("Enrolled in DevOps Course!")),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'DevOps',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Color.fromARGB(255, 74, 177, 74),
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
