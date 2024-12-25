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
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Space between logo and text
            Text(
              'What is your vibe today?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40), // Add some spacing below the text
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Joyful',
                      color: Color.fromARGB(255, 180, 230, 150), // Pastel Green
                      icon: Icons.sentiment_very_satisfied,
                      textColor: Color.fromARGB(255, 0, 80, 0), // Dark Green
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Calm',
                      color: Color.fromARGB(255, 160, 200, 230), // Pastel Blue
                      icon: Icons.airline_seat_individual_suite,
                      textColor: Color.fromARGB(255, 0, 60, 120), // Darker Blue
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Energized',
                      color: Color.fromARGB(255, 255, 150, 150), // Pastel Red
                      icon: Icons.flash_on,
                      textColor: Color.fromARGB(255, 150, 0, 0), // Dark Red
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Down',
                      color: Color.fromARGB(
                          255, 180, 180, 200), // Pastel Slate Gray
                      icon: Icons.sentiment_dissatisfied,
                      textColor:
                          Color.fromARGB(255, 80, 80, 100), // Darker Slate Gray
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Focused',
                      color:
                          Color.fromARGB(255, 180, 140, 255), // Pastel Indigo
                      icon: Icons.lightbulb,
                      textColor:
                          Color.fromARGB(255, 60, 40, 120), // Dark Indigo
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Loved',
                      color: Color.fromARGB(255, 255, 180, 180), // Pastel Red
                      icon: Icons.favorite,
                      textColor: Color.fromARGB(255, 150, 0, 50), // Dark Pink
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Chill',
                      color: Color.fromARGB(
                          255, 180, 210, 230), // Pastel Steel Blue
                      icon: Icons.beach_access,
                      textColor:
                          Color.fromARGB(255, 70, 130, 180), // Steel Blue
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Excited',
                      color:
                          Color.fromARGB(255, 255, 180, 100), // Pastel Orange
                      icon: Icons.music_note,
                      textColor: Color.fromARGB(255, 150, 80, 0), // Dark Orange
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: MoodButton(
                      mood: 'Reflective',
                      color: Color.fromARGB(
                          255, 150, 150, 255), // Pastel Midnight Blue
                      icon: Icons.cloud,
                      textColor:
                          Color.fromARGB(255, 50, 50, 150), // Darker Blue
                    ),
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
