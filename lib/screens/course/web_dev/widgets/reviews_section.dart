import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Reviews (10)',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildReviewTile('Jane Doe', '5 months ago', 'Lorem ipsum dolor sit amet consectetur. Euismod cras sed consequat consequat. Odio arcu dui eu sit etiam nisl.', 5.0),
        _buildReviewTile('John Doe', '5 months ago', 'Lorem ipsum dolor sit amet consectetur. Euismod cras sed consequat consequat. Odio arcu dui eu sit etiam nisl.', 5.0),
        _buildReviewTile('Michael Kubi', '5 months ago', 'Lorem ipsum dolor sit amet consectetur. Euismod cras sed consequat consequat. Odio arcu dui eu sit etiam nisl.', 5.0),
        _buildReviewTile('Asiamah Tony', '5 months ago', 'Lorem ipsum dolor sit amet consectetur. Euismod cras sed consequat consequat. Odio arcu dui eu sit etiam nisl.', 5.0),
      ],
    );
  }

  Widget _buildReviewTile(String name, String date, String review, double rating) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/mentor.jpeg'),
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date),
          const SizedBox(height: 5),
          Text(review),
          const SizedBox(height: 5),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
              );
            }),
          ),
        ],
      ),
    );
  }
}
