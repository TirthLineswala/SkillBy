// import 'package:flutter/material.dart';



// class Graphic extends StatefulWidget {
//   @override
//   State<Graphic> createState() => _GraphicState();
// }

// class _GraphicState extends State<Graphic> {
//   final List<RoadmapStep> steps = [
//     RoadmapStep(
//       title: "Introduction to Graphic Design",
//       description: "Learn the basics of graphic design and its tools.",
//       icon: Icons.lightbulb_outline,
//     ),
//     RoadmapStep(
//       title: "Design Principles & Theory",
//       description: "Understand color theory, typography, and composition.",
//       icon: Icons.palette,
//     ),
//     RoadmapStep(
//       title: "Tools & Software Mastery",
//       description: "Master Photoshop, Illustrator, Figma, and Canva.",
//       icon: Icons.computer,
//     ),
//     RoadmapStep(
//       title: "Branding & Logo Design",
//       description: "Create stunning logos and branding elements.",
//       icon: Icons.business,
//     ),
//     RoadmapStep(
//       title: "UI/UX Design Basics",
//       description: "Learn wireframing, prototyping, and app design.",
//       icon: Icons.phone_android,
//     ),
//     RoadmapStep(
//       title: "Social Media & Marketing Graphics",
//       description: "Design ads, thumbnails, and marketing materials.",
//       icon: Icons.campaign,
//     ),
//     RoadmapStep(
//       title: "Motion Graphics & Video Editing",
//       description: "Introduction to After Effects and Premiere Pro.",
//       icon: Icons.movie,
//     ),
//     RoadmapStep(
//       title: "Portfolio & Freelancing",
//       description: "Build a strong portfolio and get freelance clients.",
//       icon: Icons.work,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Graphic Design Roadmap"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: ListView.builder(
//           itemCount: steps.length,
//           itemBuilder: (context, index) {
//             return RoadmapTile(step: steps[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// class RoadmapStep {
//   final String title;
//   final String description;
//   final IconData icon;

//   RoadmapStep({required this.title, required this.description, required this.icon});
// }

// class RoadmapTile extends StatefulWidget {
//   final RoadmapStep step;

//   RoadmapTile({required this.step});

//   @override
//   _RoadmapTileState createState() => _RoadmapTileState();
// }

// class _RoadmapTileState extends State<RoadmapTile> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ExpansionTile(
//         leading: Icon(widget.step.icon, color: Colors.blue),
//         title: Text(widget.step.title, style: TextStyle(fontWeight: FontWeight.bold)),
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Text(widget.step.description, style: TextStyle(color: Colors.black87)),
//           ),
//           // Placeholder for Video
//           Container(
//             margin: EdgeInsets.all(16),
//             height: 200,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(child: Text("Video Placeholder", style: TextStyle(color: Colors.black54))),
//           ),
//         ],
//       ),
//     );
//   }
// }
