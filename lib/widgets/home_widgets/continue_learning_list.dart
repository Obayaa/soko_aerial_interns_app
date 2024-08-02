// lib/widgets/home_widgets/continue_learning_list.dart

import 'package:flutter/material.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';
import '../../data/models/course.dart';

class ContinueLearningList extends StatelessWidget {
  const ContinueLearningList({super.key});

  @override
  Widget build(BuildContext context) {
    // This is a placeholder. In a real app, you'd fetch this data from an API or local database
    final List<Course> courses = [
      Course(title: 'Flutter Basics', progress: 0.7, imageUrl: 'assets/flutter_basics.jpg'),
      Course(title: 'Advanced Python', progress: 0.4, imageUrl: 'assets/advanced_python.jpg'),
      // Add more courses as needed
    ];

    return ListView.builder(
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
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),
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