import 'package:flutter/material.dart';

class DroneEngineeringScreen extends StatelessWidget {
  const DroneEngineeringScreen({super.key});

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
          title: const Text('Drone Engineering'),
      ),
      body: const Center(child: Text("Still in progress"),),
    );
  }
}