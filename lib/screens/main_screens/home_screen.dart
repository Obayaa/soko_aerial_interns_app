// lib/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import '../../widgets/home_widgets/category_section.dart';
import '../../widgets/home_widgets/continue_learning_section.dart';
import '../../widgets/home_widgets/course_section.dart';
import '../../widgets/home_widgets/mentor_section.dart';
import '../../widgets/reusable_widgets/custom_bottom_navigation_bar.dart';
import '../../utils/app_theme.dart';
import '../../utils/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.greeting,
                                style: AppTheme.headerTextStyle,
                              ),
                              Text(
                                Strings.learningPrompt,
                                style: AppTheme.subHeaderTextStyle,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.grey),
                            hintText: Strings.searchHint,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 16.0),
              const CategorySection(),
              const SizedBox(height: 16.0),
              const CourseSection(),
              const SizedBox(height: 16.0),
              const MentorSection(),
              const SizedBox(height: 16.0),
              const ContinueLearningSection(),
            ]),
          ),
        ],
      ),
    );
  }
}