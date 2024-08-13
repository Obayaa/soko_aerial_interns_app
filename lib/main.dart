// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_aerial_interns_app/firebase_options.dart';
import 'package:soko_aerial_interns_app/screens/authentication/forgot_password.dart';
import 'package:soko_aerial_interns_app/screens/course/desktop.dart';
import 'package:soko_aerial_interns_app/screens/course/drone.dart';
import 'package:soko_aerial_interns_app/screens/course/drone_engineering.dart';
import 'package:soko_aerial_interns_app/screens/course/flutter.dart';
import 'package:soko_aerial_interns_app/screens/course/ui_ux.dart';
import 'package:soko_aerial_interns_app/screens/course/web_dev/web_dev_screen.dart';
import 'package:soko_aerial_interns_app/screens/main_screens/home_screen.dart';
import 'package:soko_aerial_interns_app/screens/main_screens/welcome_screen.dart';
import 'package:soko_aerial_interns_app/screens/main_screens/onboarding_screen.dart';
import 'package:soko_aerial_interns_app/screens/authentication/login_screen.dart';
import 'package:soko_aerial_interns_app/screens/authentication/signup_screen.dart';
import 'package:soko_aerial_interns_app/data/repositories/user_repository.dart';
import 'package:soko_aerial_interns_app/screens/profile/profile_screen.dart';
import 'package:soko_aerial_interns_app/screens/see_all/all_courses.dart';
import 'package:soko_aerial_interns_app/screens/see_all/all_mentors.dart';
import 'package:soko_aerial_interns_app/services/auth_service.dart';
import 'blocs/authentication/authentication_bloc.dart';
import 'screens/course/arduino.dart';
import 'screens/course/mapping.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(authService: AuthService()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              userRepository: context.read<UserRepository>(),
            )..add(AppStarted()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        '/login': (context) => BlocProvider.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child:
                  LoginScreen(userRepository: context.read<UserRepository>()),
            ),
        '/signup': (context) => BlocProvider.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child:
                  SignupScreen(userRepository: context.read<UserRepository>()),
            ),
        '/home': (context) => HomeScreen(
              userRepository: context.read<UserRepository>(),
            ),
        '/mentors': (context) => AllMentorsScreen(),
        '/courses': (context) => const AllCoursesScreen(),
        '/web_dev_screen': (context) => const WebDevelopmentScreen(),
        '/ui_ux': (context) => const UIUXScreen(),
        '/drone_engineering': (context) => const DroneEngineeringScreen(),
        '/mapping': (context) => const MappingScreen(),
        '/arduino': (context) => const ArduinoScreen(),
        '/drone': (context) => const DroneScreen(),
        '/desktop': (context) => const DesktopAppScreen(),
        '/mobile': (context) => const MobileScreen(),
        '/profile': (context) => BlocProvider.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child:
                  ProfileScreen(userRepository: context.read<UserRepository>()),
            ),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
