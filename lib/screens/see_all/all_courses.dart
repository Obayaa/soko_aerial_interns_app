import 'package:flutter/material.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Courses'),
        backgroundColor: const Color.fromARGB(255, 2, 88, 236),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          CourseItem(
            title: 'Web Development',
            instructor: 'John Doe',
            imageUrl: 'assets/images/web.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/web_dev');
            },
          ),
          CourseItem(
            title: 'UI/UX Design',
            instructor: 'Emma W.',
            imageUrl: 'assets/images/ui.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/ui_ux');
            },
          ),
          CourseItem(
            title: 'Mobile App Development',
            instructor: 'Bright Osei',
            imageUrl: 'assets/images/mobile.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/flutter');
            },
          ),
          CourseItem(
            title: 'Desktop App Development',
            instructor: 'David O.',
            imageUrl: 'assets/images/desktop.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/desktop');
            },
          ),
          CourseItem(
            title: 'Arduino',
            instructor: 'Bright Osei',
            imageUrl: 'assets/images/arduino.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/arduino');
            },
          ),
          CourseItem(
            title: 'Mapping',
            instructor: 'David O.',
            imageUrl: 'assets/images/mapping.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/mapping');
            },
          ),
          CourseItem(
            title: 'Drone Engineering',
            instructor: 'Bright Osei',
            imageUrl: 'assets/images/drone_engineering.jpg',
            onTap: () {
              Navigator.pushNamed(context, '/drone_engineering');
            },
          ),
        ],
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String title;
  final String instructor;
  final String imageUrl;
  final VoidCallback onTap;

  const CourseItem({
    super.key,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text('Instructor: $instructor'),
      ),
    );
  }
}
