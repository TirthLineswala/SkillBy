import 'package:firebase_test/Home/video.dart';
import 'package:flutter/material.dart';
import 'bookmark.dart';

//! Global List to Store Bookmarked Courses
List<Map<String, dynamic>> bookmarkedCourses = [];

class PopularCoursesScreen extends StatefulWidget {
  final String selectedCategory; // Accept category as a parameter

  PopularCoursesScreen({required this.selectedCategory});
  @override
  _PopularCoursesScreenState createState() => _PopularCoursesScreenState();
}

class _PopularCoursesScreenState extends State<PopularCoursesScreen> {
  List<String> categories = [
    "All",
    "Graphic Design",
    "IT",
    "Software Development",
    "IOS",
    "Python",
    "DevOps",
    "php",
    ".Net",
    "Full Stack",
    "Machine Learning",
    "Android",
    "Java",
    "Web Development",
    "Marketing",
  ];
  String selectedCategory = "All";

  List<Map<String, dynamic>> courses = [
    {
      'category': 'Graphic Design',
      'title': 'Graphic Design Advanced',
      'price': '\$28',
      'oldPrice': '\$42',
      'rating': 4.2,
      'students': '7830 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/g1.mp4',
    },
    {
      'category': 'Graphic Design',
      'title': 'Advertisement Design',
      'price': '\$42',
      'oldPrice': '\$61',
      'rating': 3.9,
      'students': '12680 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/g2.mp4',
    },
    {
      'category': 'Marketing',
      'title': 'Strategic Planning ',
      'price': '\$37',
      'oldPrice': '\$41',
      'rating': 4.2,
      'students': '990 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/m1.mp4',
    },
    {
      'category': 'Web Development',
      'title': 'Web Developer Concepts',
      'price': '\$56',
      'oldPrice': '\$71',
      'rating': 4.9,
      'students': '14580 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/w1.mp4',
    },
    {
      'category': 'Software Development',
      'title': 'Software Concepts',
      'price': '\$56',
      'oldPrice': '\$71',
      'rating': 4.9,
      'students': '14580 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/s1.mp4',
    },
    {
      'category': 'Java',
      'title': 'Js Scripting',
      'price': '\$56',
      'oldPrice': '\$71',
      'rating': 4.4,
      'students': '14580 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/java1.mp4',
    },
    {
      'category': 'IT',
      'title': 'Database Management System',
      'price': '\$45',
      'oldPrice': '\$59',
      'rating': 4.6,
      'students': '45356 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/i1.mp4',
    },
    {
      'category': 'Java',
      'title': 'Java Content',
      'price': '\$56',
      'oldPrice': '\$71',
      'rating': 4.9,
      'students': '1032 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/java2.mp4',
    },
    {
      'category': 'Application Development',
      'title': 'Programming languages',
      'price': '\$42',
      'oldPrice': '\$61',
      'rating': 4.0,
      'students': '12680 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/ap1.mp4',
    },
    {
      'category': 'php',
      'title': 'Script writing',
      'price': '\$30',
      'oldPrice': '\$35',
      'rating': 4.1,
      'students': '52341 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/php1.mp4',
    },
    {
      'category': 'Python',
      'title': 'Introduction To Python',
      'price': '\$45',
      'oldPrice': '\$60',
      'rating': 4.5,
      'students': '9850 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/p1.mp4',
    },
    {
      'category': 'IOS',
      'title': 'Instroduction To Swift Programming',
      'price': '\$45',
      'oldPrice': '\$50',
      'rating': 4.3,
      'students': '12436 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/io1.mp4',
    },
    {
      'category': 'Machine Learning',
      'title': 'Advance Model Evaluation',
      'price': '\$40',
      'oldPrice': '\$35',
      'rating': 4.2,
      'students': '15243 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/ml1.mp4',
    },
    {
      'category': 'Android',
      'title': 'Introduction To NLP',
      'price': '\$37',
      'oldPrice': '\$41',
      'rating': 4.6,
      'students': '990 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/an1.mp4',
    },
    {
      'category': '.Net',
      'title': 'Introduction To ASP.NET',
      'price': '\$35',
      'oldPrice': '\$37',
      'rating': 4.1,
      'students': '4231 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/net1.mp4',
    },
    {
      'category': 'Full Stack',
      'title': 'Introduction To Front-End Technologies ',
      'price': '\$41',
      'oldPrice': '\$55',
      'rating': 4.3,
      'students': '32420 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/f1.mp4',
    },
    {
      'category': 'DevOps',
      'title': 'DevOps Fundamentals',
      'price': '\$30',
      'oldPrice': '\$45',
      'rating': 4.1,
      'students': '1459 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/dev1.mp4',
    },
    {
      'category': '.Net',
      'title': 'Advance C# programming',
      'price': '\$31',
      'oldPrice': '\$42',
      'rating': 3.8,
      'students': '53324 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/net2.mp4',
    },
    {
      'category': 'Python',
      'title': 'Introduction To Python',
      'price': '\$45',
      'oldPrice': '\$60',
      'rating': 4.5,
      'students': '9850 Std',
      'bookmarked': false,
      'videoPath': 'assets/videos/p2.mp4', // ✅ NEW
    },
  ];
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);

  void toggleBookmark(int index) {
    setState(() {
      courses[index]['bookmarked'] = !courses[index]['bookmarked'];

      if (courses[index]['bookmarked']) {
        bookmarkedCourses.add(courses[index]); // Add to bookmark list
      } else {
        bookmarkedCourses.removeWhere(
            (course) => course['title'] == courses[index]['title']);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: c1),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Popular Courses',
          style: TextStyle(color: c1, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark, color: c1),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BookmarkScreen())); // Open Bookmark Screen
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Categories Filter
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedCategory == categories[index]
                          ? c3
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: selectedCategory == categories[index]
                            ? Colors.white
                            : c1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),

          // Course List
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                if (selectedCategory != "All" &&
                    courses[index]['category'] != selectedCategory) {
                  return SizedBox.shrink();
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Video Placeholder
                        courses[index]['videoPath'] != null
                            ? SizedBox(
                                width: 100,
                                height: 80,
                                child: VideoPreview(
                                    assetPath: courses[index]['videoPath']),
                              )
                            : Container(
                                width: 100,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(Icons.play_circle_outline,
                                      size: 40, color: Colors.grey),
                                ),
                              ),

                        SizedBox(width: 10),

                        // Course Details
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  courses[index]['category'],
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  courses[index]['title'],
                                  style: TextStyle(
                                    color: c1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),

                                // Price & Rating
                                Row(
                                  children: [
                                    Text(
                                      courses[index]['price'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: c3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      courses[index]['oldPrice'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),

                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      courses[index]['rating'].toString(),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      courses[index]['students'],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Bookmark Icon
                        IconButton(
                          icon: Icon(
                            courses[index]['bookmarked']
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: c3,
                          ),
                          onPressed: () {
                            toggleBookmark(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
