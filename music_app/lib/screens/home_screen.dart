import 'package:flutter/material.dart';
import 'mood_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MusiCalm',
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is your vibe today?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            MoodButton(
              mood: 'Happy',
              color: Colors.green,
              icon: Icons.sentiment_very_satisfied,
            ),
            SizedBox(height: 20),
            MoodButton(
              mood: 'Relaxed',
              color: Colors.blue,
              icon: Icons.sentiment_satisfied_alt,
            ),
            SizedBox(height: 20),
            MoodButton(
              mood: 'Energetic',
              color: Colors.red,
              icon: Icons.flash_on,
            ),
            SizedBox(height: 20),
            MoodButton(
              mood: 'Sad',
              color: Colors.blueGrey,
              icon: Icons.sentiment_dissatisfied,
            ),
          ],
        ),
      ),
    );
  }
}
