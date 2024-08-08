import 'package:flutter/material.dart';

class LessonsSection extends StatelessWidget {
  const LessonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Lessons (15)',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildSectionTitle('Section 1 - Introduction'),
        _buildLessonTile('01', 'Introduction to web development'),
        _buildLessonTile('02', 'Introduction to web development'),
        _buildSectionTitle('Section 2 - Fundamentals'),
        _buildLessonTile('03', 'Introduction to web development'),
        _buildLessonTile('04', 'Introduction to web development'),
        _buildLessonTile('05', 'Introduction to web development'),
        _buildLessonTile('06', 'Introduction to web development'),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLessonTile(String number, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          number,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(title),
      trailing: const Icon(Icons.lock),
    );
  }
}
