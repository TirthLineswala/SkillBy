import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Section> sections = [
    Section(
      number: 1,
      title: "Introduction",
      duration: "25 Mins",
      lessons: [
        Lesson(
            title: "Why Using Graphic Design?",
            duration: "15 Mins",
            isLocked: false),
        Lesson(
            title: "Setup Your Graphic Design Tools",
            duration: "10 Mins",
            isLocked: false),
      ],
    ),
    Section(
      number: 2,
      title: "Graphic Design",
      duration: "55 Mins",
      lessons: [
        Lesson(
            title: "Take a Look at Graphic Design",
            duration: "08 Mins",
            isLocked: true),
        Lesson(
            title: "Working with Graphic Design",
            duration: "25 Mins",
            isLocked: true),
        Lesson(
            title: "Working with Frames & Layouts",
            duration: "12 Mins",
            isLocked: true),
        Lesson(
            title: "Using Graphic Plugins",
            duration: "10 Mins",
            isLocked: true),
      ],
    ),
    Section(
      number: 3,
      title: "Let's Practice",
      duration: "35 Mins",
      lessons: [
        Lesson(
            title: "Let's Design a Sign-Up Form",
            duration: "15 Mins",
            isLocked: false),
        Lesson(
            title: "Sharing Work with Team",
            duration: "20 Mins",
            isLocked: false),
      ],
    ),
  ];

  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Application Development",
          style: TextStyle(color: c1),
        ),
        elevation: 0,
        leading: IconButton(
          icon: InkWell(
            child: Icon(Icons.arrow_back, color: c1),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return SectionTile(section: sections[index]);
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: c2,
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enroll Course - \$55",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class Section {
  final int number;
  final String title;
  final String duration;
  final List<Lesson> lessons;

  Section(
      {required this.number,
      required this.title,
      required this.duration,
      required this.lessons});
}

class Lesson {
  final String title;
  final String duration;
  final bool isLocked;

  Lesson({required this.title, required this.duration, required this.isLocked});
}

class SectionTile extends StatelessWidget {
  final Section section;

  SectionTile({required this.section});
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${section.number.toString().padLeft(2, '0')} - ${section.title}",
              style: TextStyle(fontWeight: FontWeight.bold, color: c2),
            ),
            Text(section.duration,
                style: TextStyle(color: c3, fontWeight: FontWeight.bold)),
          ],
        ),
        children: section.lessons
            .map((lesson) => LessonTile(lesson: lesson))
            .toList(),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final Lesson lesson;

  LessonTile({required this.lesson});
  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);
  Color c3 = Color.fromRGBO(88, 145, 172, 1);
  Color c4 = Color.fromRGBO(158, 207, 221, 1);
  Color c5 = Color.fromRGBO(208, 215, 225, 1);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: c5,
        child: Text(
          (lesson.title.split(" ")[0]).substring(0, 2), // Shortened title
          style: TextStyle(color: c3, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: c1),
      ),
      subtitle: Text(lesson.duration, style: TextStyle(color: Colors.grey)),
      trailing: Icon(
        lesson.isLocked ? Icons.lock : Icons.play_circle_fill,
        color: lesson.isLocked ? Colors.grey : c3,
      ),
    );
  }
}
