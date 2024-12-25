import 'package:flutter/material.dart';

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
      onPressed: () {},
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
