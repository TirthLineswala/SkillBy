import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class MachineLearningRoadmapScreen extends StatefulWidget {
  @override
  _MachineLearningRoadmapScreenState createState() =>
      _MachineLearningRoadmapScreenState();
}

class _MachineLearningRoadmapScreenState
    extends State<MachineLearningRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Linear Algebra (Vectors, Matrices, Eigenvalues)",
      "description": "Learn the foundation of ML through matrices and vectors.",
      "icon": Icons.calculate,
      "completed": false,
    },
    {
      "title": "Probability & Statistics",
      "description":
          "Understand probability distributions, Bayes theorem, and more.",
      "icon": Icons.bar_chart,
      "completed": false,
    },
    {
      "title": "Gradient Descent & Optimization",
      "description": "Learn how models minimize errors through optimization.",
      "icon": Icons.trending_down,
      "completed": false,
    },
    {
      "title": "Python Basics & Data Handling",
      "description":
          "Master Python, NumPy, and Pandas for ML data manipulation.",
      "icon": Icons.code,
      "completed": false,
    },
    {
      "title": "Data Visualization (Matplotlib & Seaborn)",
      "description": "Learn how to visualize ML data effectively.",
      "icon": Icons.insert_chart,
      "completed": false,
    },
    {
      "title": "Supervised & Unsupervised Learning",
      "description": "Understand regression, classification, and clustering.",
      "icon": Icons.school,
      "completed": false,
    },
    {
      "title": "Neural Networks & Deep Learning",
      "description":
          "Study artificial neurons and deep learning architectures.",
      "icon": Icons.memory,
      "completed": false,
    },
    {
      "title": "Convolutional Neural Networks (CNNs)",
      "description": "Learn how CNNs power computer vision applications.",
      "icon": Icons.image,
      "completed": false,
    },
    {
      "title": "Recurrent Neural Networks (RNNs, LSTMs)",
      "description": "Explore sequence models for NLP & time-series data.",
      "icon": Icons.timeline,
      "completed": false,
    },
    {
      "title": "Model Deployment & MLOps",
      "description":
          "Deploy ML models using Flask, FastAPI, and cloud services.",
      "icon": Icons.cloud_upload,
      "completed": false,
    },
  ];

  // Function to calculate the progress
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
        title: Text("Machine Learning Roadmap"),
        backgroundColor: Color.fromARGB(255, 218, 137, 44),
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
                    "Machine Learning Roadmap 🤖",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "From Basics to Deployment",
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
              color: Color.fromARGB(255, 192, 113, 22),
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
                            ? Color.fromARGB(255, 218, 137, 44)
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
                            ? Color.fromARGB(255, 218, 137, 44)
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
      SnackBar(content: Text("Enrolled in ML Learning Path! 🤖")),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'ML',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: const Color.fromARGB(255, 218, 137, 44),
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
