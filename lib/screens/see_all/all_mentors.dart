import 'package:flutter/material.dart';

class AllMentorsScreen extends StatelessWidget {
  final List<Mentor> mentors = [
    Mentor('Hubert Amponsah', 'Python Application Developer', 'assets/images/mentor.jpeg'),
    Mentor('Mark Amoakohene', 'Web Application Developer', 'assets/images/mentor.jpeg'),
    Mentor('Sampson Adu-Gyamfi', 'UI/UX Designer', 'assets/images/mentor.jpeg'),
    Mentor('Bernard Amoateng', 'Arduino Programming Dev...', 'assets/images/mentor.jpeg'),
    Mentor('Bright Opoku', 'Mobile App Developer', 'assets/images/mentor.jpeg'),
    Mentor('Edmond Ayitey', 'Python App Developer', 'assets/images/mentor.jpeg'),
    Mentor('Martin Mawusi', 'Autonomous Flight D...', 'assets/images/mentor.jpeg'),
    Mentor('Godfrey Hudson', 'Drone Engineer', 'assets/images/mentor.jpeg'),
    Mentor('Confidence Gawu', 'Site Mapping Instructor', 'assets/images/mentor.jpeg'),
    Mentor('Eric Amenyo', 'Drone Basic Trainer', 'assets/images/mentor.jpeg'),
    Mentor('Edem Mawuena', 'Drone Engineer', 'assets/images/mentor.jpeg'),
    Mentor('Benedicta Ayetey', 'Drone pilot/Map instr...', 'assets/images/mentor.jpeg'),
    Mentor('George Ntori', 'Python Application Dev...', 'assets/images/mentor.jpeg'),
    Mentor('Jedidiah K. Tetteh', 'Drone Expert', 'assets/images/mentor.jpeg'),
    Mentor('Ernest Keteku', 'Geographic Site map...', 'assets/images/mentor.jpeg'),
    Mentor('wences whyne', '3D Designer', 'assets/images/mentor.jpeg'),
    Mentor('Ernest Quan', 'Design Engineer', 'assets/images/mentor.jpeg'),
  ];

   AllMentorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        title: const Text('All Mentors', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          return MentorListItem(mentor: mentors[index]);
        },
      ),
    );
  }
}

class Mentor {
  final String name;
  final String role;
  final String imagePath;

  Mentor(this.name, this.role, this.imagePath);
}

class MentorListItem extends StatelessWidget {
  final Mentor mentor;

  const MentorListItem({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(mentor.imagePath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mentor.name,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  mentor.role,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}