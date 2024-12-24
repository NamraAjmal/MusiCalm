import 'package:flutter/material.dart';
import 'song_recommendation_page.dart';

class MoodButton extends StatelessWidget {
  final String mood;
  final Color color;
  final IconData icon;

  const MoodButton({
    required this.mood,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SongRecommendationPage(mood: mood)),
        );
      },
      icon: Icon(icon, size: 30),
      label: Text(
        mood,
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
    );
  }
}
