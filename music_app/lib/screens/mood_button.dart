import 'package:flutter/material.dart';
import 'song_recommendation_page.dart'; // Import the page for navigation

class MoodButton extends StatelessWidget {
  final String mood;
  final Color color;
  final IconData icon;
  final Color textColor;

  const MoodButton({
    required this.mood,
    required this.color,
    required this.icon,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate to the SongRecommendationPage and pass the mood
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongRecommendationPage(mood: mood),
          ),
        );
      },
      icon: Icon(icon, size: 30, color: textColor),
      label: Text(
        mood,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
    );
  }
}
