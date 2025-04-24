import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Subcategories
  Map<String, bool> subCategories = {
    'Python': false,
    'Web Development': false,
    'Java': false,
    'Graphic Design': false,
    'Marketing': false,
    'Android': false,
  };

  // Levels
  Map<String, bool> levels = {
    'All Levels': false,
    'Beginner': true,
    'Intermediate': true,
    'Expert': false,
  };

  // Price
  Map<String, bool> price = {
    'Paid': true,
    'Free': false,
  };

  // Features
  Map<String, bool> features = {
    'All Caption': false,
    'Quizzes': false,
    'Coding Exercise': false,
    'Practice Tests': false,
  };

  // Ratings
  Map<String, bool> ratings = {
    '4.5 & Up Above': false,
    '4.0 & Up Above': false,
    '3.5 & Up Above': false,
    '3.0 & Up Above': false,
  };

  // Video Durationsw
  Map<String, bool> durations = {
    '0-2 Hours': false,
    '2-4 Hours': false,
    '4-7 Hours': false,
    '7+ Hours': false,
  };

  void clearFilters() {
    setState(() {
      subCategories.updateAll((key, value) => false);
      levels.updateAll((key, value) => false);
      price.updateAll((key, value) => false);
      features.updateAll((key, value) => false);
      ratings.updateAll((key, value) => false);
      durations.updateAll((key, value) => false);
    });
  }

  void applyFilters() {
    Map<String, dynamic> selectedFilters = {
      'SubCategories': subCategories.entries
          .where((element) => element.value)
          .map((e) => e.key)
          .toList(),
      'Levels': levels.entries
          .where((element) => element.value)
          .map((e) => e.key)
          .toList(),
      'Price': price.entries
          .where((element) => element.value)
          .map((e) => e.key)
          .toList(),
      'Features': features.entries
          .where((element) => element.value)
          .map((e) => e.key)
          .toList(),
      'Ratings': ratings.entries
          .where((element) => element.value)
          .map((e) => e.key)
          .toList(),
      'Video Durations': durations.entries
          .where((element) => element.value)
          .map((e) => e.key)
          .toList(),
    };

    // Return selected filters to previous screen
    Navigator.pop(context, selectedFilters);
  }

  Widget buildFilterSection(String title, Map<String, bool> filterOptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ...filterOptions.keys.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: filterOptions[option],
            activeColor: Colors.green,
            onChanged: (bool? value) {
              setState(() {
                filterOptions[option] = value!;
              });
            },
          );
        }).toList(),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Filter', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: clearFilters,
            child: Text('Clear', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFilterSection('SubCategories:', subCategories),
            buildFilterSection('Levels:', levels),
            buildFilterSection('Price:', price),
            buildFilterSection('Features:', features),
            buildFilterSection('Ratings:', ratings),
            buildFilterSection('Video Durations:', durations),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: applyFilters,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Apply', style: TextStyle(fontSize: 18, color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
