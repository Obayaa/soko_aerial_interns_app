// lib/widgets/home_widgets/continue_learning_section.dart

import 'package:flutter/material.dart';
// import '../../utils/app_theme.dart';
import '../../utils/strings.dart';
import 'section_title.dart';
import 'continue_learning_list.dart';

class ContinueLearningSection extends StatelessWidget {
  const ContinueLearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: Strings.continueLearning,
          onSeeAll: () => Navigator.pushNamed(context, '/continue_learning'),
        ),
        const SizedBox(height: 8.0),
        const ContinueLearningList(),
      ],
    );
  }
}
