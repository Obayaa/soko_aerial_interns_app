import 'package:flutter/material.dart';

class ArduinoScreen extends StatelessWidget {
  const ArduinoScreen({super.key});

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
          title: const Text('Arduino Programming'),
      ),
      body: const Center(child: Text("Still in progress"),),
    );
  }
}