import 'package:flutter/material.dart';

class ContinueLearningItem extends StatelessWidget {
  final String title;
  final double progress;
  final String mentorName;
  final VoidCallback onTap;
  final String imageUrl;

  const ContinueLearningItem({
    super.key,
    required this.title,
    required this.progress,
    required this.mentorName,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Row(
          children: [
            // Course image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade200,
                    child: const Center(child: Icon(Icons.error, color: Colors.red)),
                  );
                },
              ),
            ),
            const SizedBox(width: 12.0),
            // Course details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // Handles text overflow
                  ),
                  const SizedBox(height: 4.0),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 4.0),
                  Text('${(progress * 100).toStringAsFixed(0)}% complete'),
                  const SizedBox(height: 4.0),
                  Text(
                    'Mentor: $mentorName',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis, // Handles text overflow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
