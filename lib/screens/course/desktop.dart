import 'package:flutter/material.dart';

class DesktopAppScreen extends StatelessWidget {
  const DesktopAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Desktop App Development'),
      ),
      body: const Center(child: Text("Still in progress"),),
    );
  }
}