import 'package:flutter/material.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';

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
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'All Mentors',
          style: AppTheme.sectionTitleStyle,
        ),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: AppTheme.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //         icon: const Icon(Icons.arrow_back, color: Colors.white),
              //         onPressed: () => Navigator.pop(context),
              //       ),
              //       const Text(
              //         'All Mentors',
              //         style: AppTheme.headerTextStyle,
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.search, color: Colors.white),
              //         onPressed: () {
              //           // Implement search functionality
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  physics: const ClampingScrollPhysics(),
                  itemCount: mentors.length,
                  itemBuilder: (context, index) {
                    return MentorListItem(mentor: mentors[index]);
                  },
                ),
              ),
            ],
          ),
        ),
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
    return Padding(
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
                  style: AppTheme.titleStyle,
                ),
                Text(
                  mentor.role,
                  style: const TextStyle(color: AppTheme.secondaryColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}