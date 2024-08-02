// lib/widgets/home_widgets/mentor_list.dart

import 'package:flutter/material.dart';
// import 'package:soko_aerial_interns_app/screens/see_all/all_mentors.dart';
import '../../data/models/mentor.dart';

class MentorList extends StatelessWidget {
  const MentorList({super.key});

  @override
  Widget build(BuildContext context) {
    // This is a placeholder. In a real app, you'd fetch this data from an API or local database
    final List<Mentor> mentors = [
      Mentor(
          name: 'John Doe',
          expertise: 'Python Developer',
          imageUrl: 'assets/images/mentor.jpeg'),
      Mentor(
          name: 'Jane Smith',
          expertise: 'UI/UX Designer',
          imageUrl: 'assets/jane_smith.jpg'),
      Mentor(name: 'Sampson Adu-Gyamfi', expertise: 'UI/UX Designer', imageUrl: 'assets/sampson.jpg'),
      Mentor(name: 'Bernard Amoateng', expertise: 'Arduino Programming Dev...',
          imageUrl: 'assets/bernard.jpg'),
      Mentor(name: 'Bright Opoku', expertise: 'Mobile App Developer', imageUrl: 'assets/bright.jpg'),
      Mentor(name: 'Edmond Ayitey', expertise: 'Python App Developer', imageUrl: 'assets/edmond.jpg'),
      Mentor(name: 'Martin Mawusi', expertise: 'Autonomous Flight D...', imageUrl: 'assets/martin.jpg'),
      Mentor(name: 'Godfrey Hudson', expertise: 'Drone Engineer', imageUrl: 'assets/godfrey.jpg'),
      Mentor(name: 'Confidence Gawu', expertise: 'Site Mapping Instructor',
          imageUrl: 'assets/confidence.jpg'),
      Mentor(name: 'Eric Amenyo', expertise: 'Drone Basic Trainer', imageUrl: 'assets/eric.jpg'),
      Mentor(name: 'Edem Mawuena', expertise: 'Drone Engineer', imageUrl: 'assets/edem.jpg'),
      Mentor(name: 'Benedicta Ayetey', expertise: 'Drone pilot/Map instr...',
          imageUrl: 'assets/benedicta.jpg'),
      Mentor(name: 'George Ntori', expertise: 'Python Application Dev...', imageUrl: 'assets/george.jpg'),
      Mentor(name: 'Jedidiah K. Tetteh', expertise: 'Drone Expert', imageUrl: 'assets/jedidiah.jpg'),
      Mentor(name: 'Ernest Keteku', expertise: 'Geographic Site map...', imageUrl: 'assets/ernest_k.jpg'),
      Mentor(name: 'wences whyne', expertise: '3D Designer', imageUrl: 'assets/wences.jpg'),
      Mentor(name: 'Ernest Quan', expertise: 'Design Engineer', imageUrl: 'assets/ernest_q.jpg'),
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          return MentorCard(mentor: mentors[index]);
        },
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
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(mentor.imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            mentor.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
