import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/repositories/user_repository.dart';
import '../../widgets/home_widgets/category_section.dart';
import '../../widgets/home_widgets/continue_learning_section.dart';
import '../../widgets/home_widgets/course_section.dart';
import '../../widgets/home_widgets/mentor_section.dart';
import '../../widgets/reusable_widgets/custom_bottom_navigation_bar.dart';
import '../../utils/app_theme.dart';
import '../../utils/strings.dart';

class HomeScreen extends StatefulWidget {
    final UserRepository userRepository;

  const HomeScreen({super.key, required this.userRepository});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String? _username = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    if (widget.userRepository.currentUser != null) {
      String? username = await widget.userRepository
          .getUsername(widget.userRepository.currentUser!.uid);
      setState(() {
        _username = username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
      body: Column(
        children: [
          Container(
            height: 200.0,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _username != null ? 'Welcome, $_username 👋!' : 'Welcome 👋!',
                            style: AppTheme.headerTextStyle,
                          ),
                          const Text(
                            Strings.learningPrompt,
                            style: AppTheme.subHeaderTextStyle,
                          ),
                        ],
                      ),
                      const Icon(
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: const [
                SizedBox(height: 16.0),
                CategorySection(),
                SizedBox(height: 16.0),
                CourseSection(),
                SizedBox(height: 16.0),
                MentorSection(),
                SizedBox(height: 16.0),
                ContinueLearningSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
