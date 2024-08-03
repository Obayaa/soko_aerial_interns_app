import 'package:flutter/material.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Courses'),
        backgroundColor: const Color(0xFF0258EC),
        leading: const Icon(Icons.arrow_back),
        actions: const [Icon(Icons.search)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CourseItem(
            title: 'Web Development',
            instructor: 'Mark Joe',
            imageUrl: 'assets/images/web_dev.png',
            onTap: () => Navigator.pushNamed(context, '/web_dev'),
          ),
          CourseItem(
            title: 'UI/UX Design',
            instructor: 'Sampson A.G.',
            imageUrl: 'assets/images/ui_ux.png',
            onTap: () => Navigator.pushNamed(context, '/ui_ux'),
          ),
          CourseItem(
            title: 'Mobile App Development',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/mobile_app.png',
            onTap: () => Navigator.pushNamed(context, '/mobile_app'),
          ),
          CourseItem(
            title: 'Desktop App Development',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/desktop_app.png',
            onTap: () => Navigator.pushNamed(context, '/desktop_app'),
          ),
          CourseItem(
            title: 'Arduino',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/arduino.png',
            onTap: () => Navigator.pushNamed(context, '/arduino'),
          ),
          CourseItem(
            title: 'Mapping',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/mapping.png',
            onTap: () => Navigator.pushNamed(context, '/mapping'),
          ),
          CourseItem(
            title: 'Drone Engineering',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/drone.png',
            onTap: () => Navigator.pushNamed(context, '/drone_engineering'),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
              child: Image.asset(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16.0, color: Colors.grey),
                      const SizedBox(width: 4.0),
                      Text(
                        instructor,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}