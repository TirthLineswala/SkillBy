import 'package:firebase_test/Home/popular.dart';
import 'package:flutter/material.dart';

class SeoMarketingRoadmapScreen extends StatefulWidget {
  @override
  _SeoMarketingRoadmapScreenState createState() =>
      _SeoMarketingRoadmapScreenState();
}

class _SeoMarketingRoadmapScreenState extends State<SeoMarketingRoadmapScreen> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Understanding Search Engines & How SEO Works",
      "description": "Learn how search engines rank websites.",
      "icon": Icons.search,
      "completed": false,
    },
    {
      "title": "Keyword Research & Competitor Analysis",
      "description": "Find high-performing keywords & analyze competitors.",
      "icon": Icons.analytics,
      "completed": false,
    },
    {
      "title": "On-Page SEO Optimization",
      "description": "Improve meta tags, headings, URLs & internal links.",
      "icon": Icons.web,
      "completed": false,
    },
    {
      "title": "Technical SEO Basics",
      "description": "Understand sitemaps, robots.txt, and page speed.",
      "icon": Icons.settings,
      "completed": false,
    },
    {
      "title": "Google Analytics & Search Console",
      "description": "Track website performance & SEO improvements.",
      "icon": Icons.trending_up,
      "completed": false,
    },
    {
      "title": "Content Marketing & Blogging for SEO",
      "description": "Create high-quality content that ranks well.",
      "icon": Icons.article,
      "completed": false,
    },
    {
      "title": "Link Building Strategies",
      "description": "Use guest posting, outreach & backlinking techniques.",
      "icon": Icons.link,
      "completed": false,
    },
    {
      "title": "Local SEO Optimization",
      "description": "Optimize for Google My Business & local search results.",
      "icon": Icons.location_on,
      "completed": false,
    },
    {
      "title": "SEO Tools & Analytics",
      "description": "Use Ahrefs, SEMrush, Moz, and other SEO tools.",
      "icon": Icons.build,
      "completed": false,
    },
    {
      "title": "Social Media & SEO",
      "description": "Leverage social platforms to improve rankings.",
      "icon": Icons.share,
      "completed": false,
    },
    {
      "title": "Paid Marketing (Google Ads, Facebook Ads)",
      "description": "Run effective PPC campaigns to increase traffic.",
      "icon": Icons.monetization_on,
      "completed": false,
    },
    {
      "title": "SEO Automation & AI in Marketing",
      "description": "Use AI & automation for advanced SEO strategies.",
      "icon": Icons.auto_awesome,
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
        title: Text("SEO & Marketing Roadmap"),
        backgroundColor: Colors.teal[900],
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
                    "SEO & Marketing Learning Path 📈",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Master SEO & Digital Marketing from basics to advanced strategies!",
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
              color: Colors.teal[800],
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
                            ? Colors.teal.shade900
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
                            ? Colors.teal.shade900
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
        content: Text("Enrolled in SEO & Marketing Learning Path! 📈"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PopularCoursesScreen(
          selectedCategory: 'SEO & Marketing',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: Colors.teal[900],
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
