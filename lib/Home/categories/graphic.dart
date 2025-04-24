import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class GraphicDesignRoadmapScreen extends StatefulWidget {
  @override
  _GraphicDesignRoadmapScreenState createState() =>
      _GraphicDesignRoadmapScreenState();
}

class _GraphicDesignRoadmapScreenState
    extends State<GraphicDesignRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Introduction to Graphic Design",
      "description":
          "Learn the fundamentals of design, color theory, and typography.",
      "icon": Icons.brush,
      "completed": true,
    },
    {
      "title": "Adobe Photoshop & Illustrator",
      "description": "Get hands-on experience with industry-standard tools.",
      "icon": Icons.design_services,
      "completed": false,
    },
    {
      "title": "Logo & Branding Design",
      "description": "Master the art of creating logos and brand identity.",
      "icon": Icons.business,
      "completed": false,
    },
    {
      "title": "UI/UX & Web Design",
      "description":
          "Understand user experience, wireframing, and prototyping.",
      "icon": Icons.web,
      "completed": false,
    },
    {
      "title": "Poster & Brochure Design",
      "description": "Create stunning marketing materials.",
      "icon": Icons.picture_as_pdf,
      "completed": false,
    },
    {
      "title": "Motion Graphics & Video Editing",
      "description":
          "Learn animation and video editing with After Effects & Premiere Pro.",
      "icon": Icons.movie,
      "completed": false,
    },
    {
      "title": "3D Design & Animation",
      "description": "Work with Blender and Cinema 4D for 3D design.",
      "icon": Icons.threed_rotation,
      "completed": false,
    },
    {
      "title": "Freelancing & Portfolio Building",
      "description": "Create a strong portfolio and start freelancing.",
      "icon": Icons.work,
      "completed": false,
    },
    {
      "title": "Landing High-Paying Clients",
      "description":
          "Learn how to market your skills and get high-paying projects.",
      "icon": Icons.attach_money,
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
        title: Text("Graphic Design Roadmap"),
        backgroundColor: Colors.blueGrey[900],
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
                    "Graphic Design Learning Path 🎨",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Start from the basics and master graphic design step by step!",
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
              color: Colors.blueGrey[900],
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
                            ? Colors.blueGrey[900]
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
                            ? Colors.blueGrey[900]
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

            //! Enroll Button
            SizedBox(height: 10),
            ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Enrolled in Graphic Design Course! 🎨"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'Graphic Design',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Colors.blueGrey[900],
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
