import 'package:flutter/material.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  get sectionTitleStyle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Popular Courses',
          style: AppTheme.sectionTitleStyle,
        ),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CourseItem(
            title: 'Web Development',
            instructor: 'Mark Joe',
            imageUrl: 'assets/images/web.jpg',
            onTap: () => Navigator.pushNamed(context, '/web_dev'),
          ),
          CourseItem(
            title: 'UI/UX Design',
            instructor: 'Sampson A.G.',
            imageUrl: 'assets/images/ui.jpg',
            onTap: () => Navigator.pushNamed(context, '/ui_ux'),
          ),
          CourseItem(
            title: 'Mobile App Development',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/mobile.jpg',
            onTap: () => Navigator.pushNamed(context, '/mobile'),
          ),
          CourseItem(
            title: 'Desktop App Development',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/desktop.jpg',
            onTap: () => Navigator.pushNamed(context, '/desktop'),
          ),
          CourseItem(
            title: 'Arduino',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/arduino.jpg',
            onTap: () => Navigator.pushNamed(context, '/arduino'),
          ),
          CourseItem(
            title: 'Mapping',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/mapping.jpg',
            onTap: () => Navigator.pushNamed(context, '/mapping'),
          ),
          CourseItem(
            title: 'Drone Engineering',
            instructor: 'Bright Opoku',
            imageUrl: 'assets/images/drone_engineering.jpg',
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
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
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
                    style: AppTheme.TitleStyle,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.person,
                          size: 25.0, color: AppTheme.secondaryColor),
                      const SizedBox(width: 4.0),
                      Text(
                        instructor,
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.secondaryColor,
                            fontFamily: 'Product Sans'),
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
