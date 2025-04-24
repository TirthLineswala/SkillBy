// import 'package:flutter/material.dart';

// class CategoryVideoListScreen extends StatelessWidget {
//   final String selectedCategory;

//   CategoryVideoListScreen({required this.selectedCategory, required categoryName});

 
//   List<Map<String, dynamic>> courses = [
//     {
//       'category': 'Graphic Design',
//       'title': 'Graphic Design Advanced',
//       'price': '\$28',
//       'oldPrice': '\$42',
//       'rating': 4.2,
//       'students': '7830 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/g1.mp4',
//     },
//     {
//       'category': 'Graphic Design',
//       'title': 'Advertisement Design',
//       'price': '\$42',
//       'oldPrice': '\$61',
//       'rating': 3.9,
//       'students': '12680 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/g2.mp4',
//     },
//     {
//       'category': 'Marketing',
//       'title': 'Strategic Planning ',
//       'price': '\$37',
//       'oldPrice': '\$41',
//       'rating': 4.2,
//       'students': '990 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/m1.mp4',
//     },
//     {
//       'category': 'Web Development',
//       'title': 'Web Developer Concepts',
//       'price': '\$56',
//       'oldPrice': '\$71',
//       'rating': 4.9,
//       'students': '14580 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/w1.mp4',
//     },
//     {
//       'category': 'Software Development',
//       'title': 'Software Concepts',
//       'price': '\$56',
//       'oldPrice': '\$71',
//       'rating': 4.9,
//       'students': '14580 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/s1.mp4',
//     },
//     {
//       'category': 'Java',
//       'title': 'Js Scripting',
//       'price': '\$56',
//       'oldPrice': '\$71',
//       'rating': 4.4,
//       'students': '14580 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/java1.mp4',
//     },
//     {
//       'category': 'IT',
//       'title': 'Database Management System',
//       'price': '\$45',
//       'oldPrice': '\$59',
//       'rating': 4.6,
//       'students': '45356 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/i1.mp4',
//     },
//     {
//       'category': 'Java',
//       'title': 'Java Content',
//       'price': '\$56',
//       'oldPrice': '\$71',
//       'rating': 4.9,
//       'students': '1032 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/java2.mp4',
//     },
//     {
//       'category': 'Application Development',
//       'title': 'Programming languages',
//       'price': '\$42',
//       'oldPrice': '\$61',
//       'rating': 4.0,
//       'students': '12680 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/ap1.mp4',
//     },
//     {
//       'category': 'php',
//       'title': 'Script writing',
//       'price': '\$30',
//       'oldPrice': '\$35',
//       'rating': 4.1,
//       'students': '52341 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/php1.mp4',
//     },
//     {
//       'category': 'Python',
//       'title': 'Introduction To Python',
//       'price': '\$45',
//       'oldPrice': '\$60',
//       'rating': 4.5,
//       'students': '9850 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/p1.mp4',
//     },
//     {
//       'category': 'IOS',
//       'title': 'Instroduction To Swift Programming',
//       'price': '\$45',
//       'oldPrice': '\$50',
//       'rating': 4.3,
//       'students': '12436 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/io1.mp4',
//     },
//     {
//       'category': 'Machine Learning',
//       'title': 'Advance Model Evaluation',
//       'price': '\$40',
//       'oldPrice': '\$35',
//       'rating': 4.2,
//       'students': '15243 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/ml1.mp4',
//     },
//     {
//       'category': 'Android',
//       'title': 'Introduction To NLP',
//       'price': '\$37',
//       'oldPrice': '\$41',
//       'rating': 4.6,
//       'students': '990 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/an1.mp4',
//     },
//     {
//       'category': '.Net',
//       'title': 'Introduction To ASP.NET',
//       'price': '\$35',
//       'oldPrice': '\$37',
//       'rating': 4.1,
//       'students': '4231 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/net1.mp4',
//     },
//     {
//       'category': 'Full Stack',
//       'title': 'Introduction To Front-End Technologies ',
//       'price': '\$41',
//       'oldPrice': '\$55',
//       'rating': 4.3,
//       'students': '32420 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/f1.mp4',
//     },
//     {
//       'category': 'DevOps',
//       'title': 'DevOps Fundamentals',
//       'price': '\$30',
//       'oldPrice': '\$45',
//       'rating': 4.1,
//       'students': '1459 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/dev1.mp4',
//     },
//     {
//       'category': '.Net',
//       'title': 'Advance C# programming',
//       'price': '\$31',
//       'oldPrice': '\$42',
//       'rating': 3.8,
//       'students': '53324 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/net2.mp4',
//     },
//     {
//       'category': 'Python',
//       'title': 'Introduction To Python',
//       'price': '\$45',
//       'oldPrice': '\$60',
//       'rating': 4.5,
//       'students': '9850 Std',
//       'bookmarked': false,
//       'videoPath': 'assets/videos/p2.mp4', // ✅ NEW
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Filter courses based on selectedCategory
//     final filteredCourses = selectedCategory == "All"
//         ? courses
//         : courses.where((course) => course['category'] == selectedCategory).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$selectedCategory Courses'),
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: filteredCourses.length,
//         itemBuilder: (context, index) {
//           final course = filteredCourses[index];
//           return ListTile(
//             leading: Image.asset(course['thumbnail']!),
//             title: Text(course['title']!),
//             onTap: () {
//               // Navigate to video player or detail
//             },
//           );
//         },
//       ),
//     );
//   }
// }
