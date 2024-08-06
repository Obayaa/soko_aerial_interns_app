// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_aerial_interns_app/screens/authentication/forgot_password.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
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
        '/profile': (context) => BlocProvider.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child:
                  ProfileScreen(userRepository: context.read<UserRepository>()),
            ),
        '/forgot_password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}
