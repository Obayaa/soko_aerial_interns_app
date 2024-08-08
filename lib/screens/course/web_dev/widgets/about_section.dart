import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Course',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Lorem ipsum dolor sit amet consectetur. Nascetur arcu magna vitae id. Neque sed in est libero ac convallis pretium netus augue. Aliquam suscipit mauris felis vulputate. Ornare ut aliquam odio nulla tincidunt semper at.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/mentor.jpeg'),
            ),
            title: const Text('Mark Amoakohene'),
            subtitle: const Text('Web Developer'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
