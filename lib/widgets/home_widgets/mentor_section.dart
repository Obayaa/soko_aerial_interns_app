// lib/widgets/home_widgets/mentor_section.dart

import 'package:flutter/material.dart';
// import '../../utils/app_theme.dart';
import '../../utils/strings.dart';
import 'section_title.dart';
import 'mentor_list.dart';

class MentorSection extends StatelessWidget {
  const MentorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: Strings.topMentor,
          onSeeAll: () => Navigator.pushNamed(context, '/mentors'),
        ),
        const SizedBox(height: 8.0),
        const MentorList(),
      ],
    );
  }
}