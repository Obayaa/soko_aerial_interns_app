import 'package:flutter/material.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';
import '../../data/models/course.dart';

class ContinueLearningList extends StatelessWidget {
  const ContinueLearningList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Course> courses = [
      Course(title: 'Flutter Basics', progress: 0.7, imageUrl: 'assets/images/mobile.jpg'),
      Course(title: 'Arduino', progress: 0.4, imageUrl: 'assets/images/arduino.jpg'),
    ];

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return ContinueLearningCard(course: courses[index]);
      },
    );
  }
}

class ContinueLearningCard extends StatelessWidget {
  final Course course;

  const ContinueLearningCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, 
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // External padding
      padding: const EdgeInsets.all(12.0), // Internal padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              course.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  course.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: course.progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(course.progress * 100).toInt()}% Complete',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
