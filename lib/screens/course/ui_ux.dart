import 'package:flutter/material.dart';

class UIUXScreen extends StatelessWidget {
  const UIUXScreen({super.key});

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
          title: const Text('UI/UX Design - Figma'),
      ),
      body: const Center(child: Text("Still in progress"),),
    );
  }
}