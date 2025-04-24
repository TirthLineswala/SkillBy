import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class SoftwareDevelopmentRoadmapScreen extends StatefulWidget {
  @override
  _SoftwareDevelopmentRoadmapScreenState createState() =>
      _SoftwareDevelopmentRoadmapScreenState();
}

class _SoftwareDevelopmentRoadmapScreenState
    extends State<SoftwareDevelopmentRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Introduction to Programming",
      "description": "Learn basic programming concepts & syntax.",
      "icon": Icons.code,
      "completed": true,
    },
    {
      "title": "Frontend Development",
      "description":
          "HTML, CSS, JavaScript, and frontend frameworks like React.",
      "icon": Icons.web,
      "completed": false,
    },
    {
      "title": "Backend Development",
      "description":
          "Databases, APIs, and backend frameworks (Node.js, Django, etc.).",
      "icon": Icons.storage,
      "completed": false,
    },
    {
      "title": "Full Stack Development",
      "description":
          "Combine frontend & backend skills to build complete applications.",
      "icon": Icons.layers,
      "completed": false,
    },
    {
      "title": "DevOps & Deployment",
      "description":
          "CI/CD, cloud hosting, Docker, Kubernetes, and automation.",
      "icon": Icons.cloud,
      "completed": false,
    },
    {
      "title": "Advanced Topics",
      "description": "AI, ML, cybersecurity, and career growth tips.",
      "icon": Icons.trending_up,
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
        title: Text("Software Development"),
        backgroundColor: Color.fromRGBO(42, 100, 137, 1),
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
                    "Your Path to Becoming a Developer 💻",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Follow this structured roadmap to learn software development step by step.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //! Progress Bar
            Text(
              "Progress: $completedSteps / $totalSteps Steps Completed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Color.fromRGBO(18, 76, 113, 1),
              minHeight: 8,
            ),
            SizedBox(height: 20),

            //! Roadmap Steps
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
                            ? Color.fromRGBO(18, 76, 113, 1)
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
                            ? Color.fromRGBO(18, 76, 113, 1)
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

            //! Start Learning Button
            SizedBox(height: 10),
           ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Enrolled in Software Development Learning Path! 🚀",
      ),
    ));
    // Navigate to PopularCoursesScreen with 'Software Development' category
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'Software Development',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Color.fromRGBO(42, 100, 137, 1),
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
)

          ],
        ),
      ),
    );
  }
}
