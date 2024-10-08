import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:soko_aerial_interns_app/data/repositories/user_repository.dart';
import 'package:soko_aerial_interns_app/blocs/authentication/authentication_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';
import '../../widgets/reusable_widgets/custom_text_field.dart';
import '../../widgets/reusable_widgets/logo_with_company_name.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  const LoginScreen({super.key, required this.userRepository});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    try {
      User? user = await widget.userRepository.signInWithCredentials(
        emailController.text,
        passwordController.text,
        context, // pass context here
      );
      if (user != null) {
        context.read<AuthenticationBloc>().add(LoggedIn(user));
        Navigator.pushReplacementNamed(context, '/home', arguments: user);
      }
    } catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login failed'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _loginWithGoogle() {
    context.read<AuthenticationBloc>().add(GoogleSignInRequested(context));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_bgd.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x70000000), Color(0x70181B5B), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Column(children: [
                const LogoWithCompanyName(),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: LoginContainerContent(
                      emailController: emailController,
                      passwordController: passwordController,
                      onPressed: () => _login(context),
                      onTap: () => _loginWithGoogle),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class LoginContainerContent extends StatelessWidget {
  const LoginContainerContent({
    super.key,
    required this.passwordController,
    required this.emailController,
    required this.onPressed,
    required this.onTap,
  });
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final VoidCallback onPressed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'ProductSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Password',
          obscureText: true,
          controller: passwordController,
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/forgot_password');
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () => onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text('Login'),
        ),
        const SizedBox(height: 5),
        const Divider(),
        const SizedBox(height: 5),
        LoginWithGoogle(
          onPressed: () => onTap,
        ),
        const SizedBox(height: 20),
        const AlternativeSignUp(),
        const SizedBox(height: 40),
      ],
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container(color: Colors.black, height: 1)),
          const SizedBox(width: 8),
          const Text(
            'Or login with',
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 8),
          Expanded(child: Container(color: Colors.black, height: 1)),
        ],
      ),
    );
  }
}

class AlternativeSignUp extends StatelessWidget {
  const AlternativeSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Sign Up Here',
              style: const TextStyle(color: AppTheme.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/signup',
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.login),
      label: const Text('Google'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
