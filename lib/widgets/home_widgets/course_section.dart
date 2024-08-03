// lib/widgets/home_widgets/course_section.dart

import 'package:flutter/material.dart';
// import '../../utils/app_theme.dart';
import '../../utils/strings.dart';
import 'section_title.dart';
import 'course_list.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: Strings.popularCourses,
          onSeeAll: () => Navigator.pushNamed(context, '/courses'),
        ),
        const SizedBox(height: 4.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CourseList(),
        ),
      ],
    );
  }
}