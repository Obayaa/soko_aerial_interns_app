import 'package:flutter/material.dart';

import 'widgets/about_section.dart';
import 'widgets/lessons_section.dart';
import 'widgets/reviews_section.dart';

class WebDevelopmentScreen extends StatelessWidget {
  const WebDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Web Development'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'About'),
              Tab(text: 'Lessons'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AboutSection(),
            LessonsSection(),
            ReviewsSection(),
          ],
        ),
      ),
    );
  }
}
