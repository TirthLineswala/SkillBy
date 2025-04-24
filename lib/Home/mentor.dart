import 'package:firebase_test/Home/mentorchatscreen.dart';
import 'package:flutter/material.dart';

class MentorSearchScreen extends StatefulWidget {
  @override
  _MentorSearchScreenState createState() => _MentorSearchScreenState();
}

class _MentorSearchScreenState extends State<MentorSearchScreen> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  final List<Map<String, String>> mentors = [
    {
      'name': 'Branden S. Baker',
      'category': '3D Design',
      'image': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'name': 'Gregory M. Padgett',
      'category': '3D Design',
      'image': 'https://randomuser.me/api/portraits/men/2.jpg'
    },
    {
      'name': 'Marie F. Munoz',
      'category': 'Java',
      'image': 'https://randomuser.me/api/portraits/women/1.jpg'
    },
    {
      'name': 'Sandra C. Florence',
      'category': 'php',
      'image': 'https://randomuser.me/api/portraits/women/2.jpg'
    },
    {
      'name': 'Justin W. Foxwell',
      'category': 'Android',
      'image': 'https://randomuser.me/api/portraits/men/3.jpg'
    },
    {
      'name': 'Donald S. Channel',
      'category': 'Machine Learning',
      'image': 'https://randomuser.me/api/portraits/men/4.jpg'
    },
    {
      'name': 'Scott S. Simpson',
      'category': 'SEO & Marketing',
      'image': 'https://randomuser.me/api/portraits/men/5.jpg'
    },
    {
      'name': 'Patricia G. Peters',
      'category': 'Python',
      'image': 'https://randomuser.me/api/portraits/women/3.jpg'
    },
    {
      'name': 'Carmen P. Mercado',
      'category': 'Web Development',
      'image': 'https://randomuser.me/api/portraits/women/4.jpg'
    },
  ];

List<Map<String, String>> get filteredMentors {
  if (searchQuery.isEmpty) return [];
  return mentors.where((mentor) {
    final name = mentor['name']!.toLowerCase();
    final category = mentor['category']!.toLowerCase();
    final query = searchQuery.toLowerCase();
    return name.contains(query) || category.contains(query);
  }).toList();
}


  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);

  @override
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
        title: Text('Mentors',
            style: TextStyle(color: c1, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Course or Mentor...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: c1),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.filter_list, color: c2),
                    onPressed: () {
                      // Implement Filter Screen Navigation
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 10),

            // 📌 Search Result Heading
            if (searchQuery.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: 'Result for ',
                    style: TextStyle(fontSize: 16, color: c1),
                    children: [
                      TextSpan(
                        text: '"$searchQuery"',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: c3),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 10),

            // 🔎 Search Results
            Expanded(
             child: filteredMentors.isNotEmpty
    ? ListView.builder(
        itemCount: filteredMentors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage(filteredMentors[index]['image']!),
            ),
            title: Text(
              filteredMentors[index]['name']!,
              style: TextStyle(fontWeight: FontWeight.bold, color: c1),
            ),
            subtitle: Text(
              filteredMentors[index]['category']!,
              style: TextStyle(color: c2.withOpacity(0.5)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MentorChatScreen(
                    mentorName: filteredMentors[index]['name']!,
                    mentorImage: filteredMentors[index]['image']!,
                    category: filteredMentors[index]['category']!,
                  ),
                ),
              );
            },
          );
        },
      )
    : Center(
        child: searchQuery.isEmpty
            ? Text("Search for a course or mentor")
            : Text("No results found"),
      ),

            ),
          ],
        ),
      ),

      // // ⬇️ Bottom Navigation Bar
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: c2,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
      //     BottomNavigationBarItem(icon: Icon(Icons.book), label: "MY COURSES"),
      //     BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "INBOX"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.receipt), label: "TRANSACTION"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
      //   ],
      // ),
    );
  }
}
