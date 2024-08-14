import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:soko_aerial_interns_app/data/repositories/user_repository.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';
import '../../widgets/reusable_widgets/custom_text_field.dart';
import '../../widgets/reusable_widgets/logo_with_company_name.dart';

class SignupScreen extends StatefulWidget {
  final UserRepository userRepository;

  const SignupScreen({super.key, required this.userRepository});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool _isAgreed = false; // Checkbox state

  Future<void> _signup(BuildContext context) async {
    if (!_isAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('You must agree with the terms and conditions.')),
      );
      return;
    }

    print(
        'Attempting to sign up with email: ${emailController.text}, password: ${passwordController.text}, username: ${usernameController.text}');

    try {
      User? user = await widget.userRepository.signUp(
        emailController.text,
        passwordController.text,
        usernameController.text,
        context,
      );
      if (user != null) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background image with linear gradient overlay
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
                    colors: [
                      Color(0x70000000),
                      Color(0x70181B5B),
                      Colors.white
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const LogoWithCompanyName(),
                    const SizedBox(height: 16),
                    signupContainer(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container signupContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25.0,
        horizontal: 20,
      ), // Internal padding
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ContainerContent(usernameController: usernameController, passwordController: passwordController, emailController: emailController, isAgreed: _isAgreed, onPressed: ()=>_signup(context),),
    );
  }
}

//contentContainer
class ContainerContent extends StatelessWidget {
  const ContainerContent({super.key, required this.isAgreed, required this.usernameController, required this.emailController, required this.passwordController, this.onChanged, required this.onPressed,});
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final bool isAgreed;
 final  void Function(bool? isAgreed)? onChanged;
 final VoidCallback onPressed;  

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: 'Username',
            keyboardType: TextInputType.text,
            controller: usernameController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Password',
            obscureText: true,
            controller: passwordController,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Checkbox(
                value: isAgreed,
                onChanged: onChanged,
              ),
              const Text('I agree to the terms and conditions'),
            ],
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () => onPressed ,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Sign Up'),
          ),
          const SizedBox(height: 20),
          const AlternativeLogin(),
          const SizedBox(height: 45),
        ],
      );
  }
}

//alternative loginBtn
class AlternativeLogin extends StatelessWidget {
  const AlternativeLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Login Here',
              style: const TextStyle(color: AppTheme.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
            ),
          ],
        ),
      ),
    );
  }
}
