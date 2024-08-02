import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "We Train",
          body: "Get comprehensive training on various technologies and Master your skills through hands-on training tailored to your role.",
          image: buildImage('assets/images/onboarding1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "We Educate",
          body: "Receive expert education from professionals and Gain comprehensive knowledge from multimedia learning resources.",
          image: buildImage('assets/images/onboarding2.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "We Research",
          body: "Engage in cutting-edge research and development, and Stay ahead with the latest research and insights.",
          image: buildImage('assets/images/onboarding3.jpg'), 
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "We Develop",
          body: "Code labs with the latest programming languages as well as Code labs, version control, and project collaboration tools.",
          image: buildImage('assets/images/onboarding4.jpeg'),
          // footer: Align(
          //   alignment: Alignment.bo,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushReplacementNamed(context, '/login');
          //     },
          //     style: ElevatedButton.styleFrom(
          //       minimumSize: const Size(200, 50),
          //       backgroundColor: const Color.fromARGB(255, 2, 88, 236),
          //       foregroundColor: Colors.white,
          //       textStyle: const TextStyle(fontSize: 18),
          //     ),
          //     child: const Text('Get Started'),
          //   ),
          // ),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('Done', style: TextStyle(color: Color.fromARGB(255, 2, 88, 236),),),
      onDone: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(color: Color.fromARGB(255, 2, 88, 236),),),
      onSkip: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: const Size(22.0, 10.0),
        activeColor: const Color.fromARGB(255, 2, 88, 236),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  Widget buildImage(String path) {
    return Center(
      child: Image.asset(path, width: 400),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontFamily: 'ProductSans',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontFamily: 'ProductSans',
        fontSize: 18,
      ),
      imagePadding: EdgeInsets.only(top: 70,), // Adjust padding
      contentMargin: EdgeInsets.all(5), // Adjust margin for overall spacing
      pageMargin: EdgeInsets.only(bottom: 10),
      bodyPadding: EdgeInsets.symmetric(horizontal: 16),
      safeArea: 30,
      pageColor: Colors.white,
    );
  }
}
