import 'package:flutter/material.dart';

class Popularin extends StatefulWidget {
  final String selectedCategory;

  Popularin({required this.selectedCategory});

  @override
  _PopularinState createState() => _PopularinState();
}

class _PopularinState extends State<Popularin> {
  List<Map<String, dynamic>> courses = [
    {'category': 'Graphic Design', 'title': 'Graphic Design Advanced', 'price': '\$28', 'oldPrice': '\$42', 'rating': 4.2, 'students': '7830 Std', 'bookmarked': true},
    {'category': 'Graphic Design', 'title': 'Advertisement Design', 'price': '\$42', 'oldPrice': '\$61', 'rating': 3.9, 'students': '12680 Std', 'bookmarked': false},
    {'category': 'Information Technology', 'title': 'Database Management System', 'price': '\$45', 'oldPrice': '\$59', 'rating': 4.6, 'students': '45356 Std', 'bookmarked': false},
    {'category': 'Python', 'title': 'Introduction To Python', 'price': '\$45', 'oldPrice': '\$60', 'rating': 4.5, 'students': '9850 Std', 'bookmarked': false},
    {'category': 'IOS', 'title': 'Introduction To Swift Programming', 'price': '\$45', 'oldPrice': '\$50', 'rating': 4.3, 'students': '12436 Std', 'bookmarked': false},
    {'category': 'Artificial Intelligence', 'title': 'Introduction To NLP', 'price': '\$37', 'oldPrice': '\$41', 'rating': 4.6, 'students': '990 Std', 'bookmarked': true},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter courses based on selected category
    List<Map<String, dynamic>> filteredCourses = courses
        .where((course) => course['category'] == widget.selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Courses'),
      ),
      body: filteredCourses.isEmpty
          ? Center(
              child: Text(
                'No courses found for "${widget.selectedCategory}"',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCourses[index]['title']),
                  subtitle: Text(filteredCourses[index]['price']),
                  trailing: Icon(
                    filteredCourses[index]['bookmarked']
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                  ),
                );
              },
            ),
    );
  }
}
