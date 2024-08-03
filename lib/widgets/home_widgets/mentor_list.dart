import 'package:flutter/material.dart';
import '../../data/models/mentor.dart';

class MentorList extends StatelessWidget {
  const MentorList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Mentor> mentors = [
      Mentor(
        name: 'John Doe',
        expertise: 'Python Developer',
        imageUrl: 'assets/images/mentor.jpeg',
      ),
      Mentor(
        name: 'Jane Smith',
        expertise: 'UI/UX Designer',
        imageUrl: 'assets/images/mentor.jpeg',
      ),
      Mentor(
        name: 'Sampson Adu-Gyamfi',
        expertise: 'UI/UX Designer',
        imageUrl: 'assets/images/mentor.jpeg',
      ),
      Mentor(
        name: 'Bernard Amoateng',
        expertise: 'Arduino Programming Dev...',
        imageUrl: 'assets/images/mentor.jpeg',
      ),
    ];

    return Container(
      height: 90, // Adjusted height
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: mentors.map((mentor) => Expanded(
          child: MentorCard(mentor: mentor),
        )).toList(),
      ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Margin for spacing between items
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35, // Adjusted radius
            backgroundImage: AssetImage(mentor.imageUrl),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              mentor.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
