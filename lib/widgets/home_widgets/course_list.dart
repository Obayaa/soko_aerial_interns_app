import 'package:flutter/material.dart';
import 'course_item.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.93,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CourseItem(
          title: 'Web Development',
          instructor: 'Mark Joe',
          imageUrl: 'assets/images/web.jpg',
          onTap: () {
            Navigator.pushNamed(context, '/course/web_dev');
          },
        ),
        CourseItem(
          title: 'UI/UX Design',
          instructor: 'Sampson Adu',
          imageUrl: 'assets/images/ui.jpg',
          onTap: () {
            Navigator.pushNamed(context, '/course/ui_ux');
          },
        ),
      ],
    );
  }
}
