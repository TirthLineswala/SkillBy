import 'package:firebase_test/Home/popular.dart';
import 'package:firebase_test/Home/removebook.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  void removeBookmark(Map<String, dynamic> course) {
    setState(() {
      bookmarkedCourses.removeWhere((item) => item['title'] == course['title']);
    });
    Navigator.pop(context); // Close the bottom sheet
  }

  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
        backgroundColor: Colors.white,
      ),
      body: bookmarkedCourses.isEmpty
          ? Center(child: Text("No bookmarks yet!"))
          : ListView.builder(
              itemCount: bookmarkedCourses.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        // Video Placeholder
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.play_circle_outline,
                                size: 50, color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            bookmarkedCourses[index]['title'],
                            style: TextStyle(color: c1),
                          ),
                          subtitle: Text(
                            bookmarkedCourses[index]['category'],
                            style: TextStyle(color: c2),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: c2),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (context) => RemoveBookmarkScreen(
                                  course: bookmarkedCourses[index],
                                  onRemove: () =>
                                      removeBookmark(bookmarkedCourses[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
