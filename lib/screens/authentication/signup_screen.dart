import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:soko_aerial_interns_app/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool _isAgreed = false; // Checkbox state

  Future<void> _signup(BuildContext context) async {
    if (!_isAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must agree with the terms and conditions.')),
      );
      return;
    }

    try {
      User? user = await widget.userRepository.signUp(
        emailController.text,
        passwordController.text,
      );
      if (user != null) {
        if (!mounted) return; // Check if the widget is still mounted
        Navigator.pushReplacementNamed(context, '/home'); // Navigate to the home screen or appropriate screen
      }
    } catch (e) {
      // Handle signup error
      if (!mounted) return; // Check if the widget is still mounted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  colors: [Color(0x70000000), Color(0x70181B5B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80), // Add space at the top
                const LogoWithCompanyName(), // Use the reusable widget here
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20), // Internal padding
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 10,
                        offset: Offset(0, -5), // Adjusted offset to create a shadow effect
                      ),
                    ],
                  ),
                  child: Column(
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
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: 'Username',
                        keyboardType: TextInputType.text,
                        controller: usernameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _isAgreed,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isAgreed = newValue ?? false;
                              });
                            },
                          ),
                          const Text('I agree to the terms and conditions'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _signup(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Container(color: Colors.black, height: 1)),
                            const SizedBox(width: 8),
                            const Text(
                              'Or sign up with',
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Container(color: Colors.black, height: 1)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle Google signup action
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Google'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Login Here',
                                style: const TextStyle(color: Color.fromARGB(255, 2, 88, 236)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(context, '/login');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
