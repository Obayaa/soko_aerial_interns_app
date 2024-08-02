import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soko_aerial_interns_app/screens/main_screens/home_screen.dart';
import 'package:soko_aerial_interns_app/screens/main_screens/welcome_screen.dart';
import 'package:soko_aerial_interns_app/screens/main_screens/onboarding_screen.dart';
import 'package:soko_aerial_interns_app/screens/authentication/login_screen.dart';
import 'package:soko_aerial_interns_app/screens/authentication/signup_screen.dart';
import 'package:soko_aerial_interns_app/data/repositories/user_repository.dart';
import 'package:soko_aerial_interns_app/screens/see_all/all_courses.dart';
import 'package:soko_aerial_interns_app/screens/see_all/all_mentors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soko Aerial Interns App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(userRepository: userRepository),
        '/signup': (context) => SignupScreen(userRepository: userRepository),
        '/home': (context) => const HomeScreen(),
        '/mentors': (context) => AllMentorsScreen(),
        '/courses': (context) => const AllCoursesScreen(),
        // '/web_dev': (context) => const WebDevelopmentCourse(),
        // '/ui_ux': (context) => const UIUXDesignCourse(),
        // '/flutter': (context) => const MobileAppDevelopmentCourse(),
        // '/desktop': (context) => const DesktopAppDevelopmentCourse(),
        // '/arduino': (context) => const ArduinoCourse(),
        // '/mapping': (context) => const MappingCourse(),
        // '/drone_engineering': (context) => const DroneEngineeringCourse(),
      },
    );
  }
}
