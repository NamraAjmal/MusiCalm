import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SongRecommendationPage extends StatefulWidget {
  final String mood;

  const SongRecommendationPage({required this.mood});

  @override
  _SongRecommendationPageState createState() => _SongRecommendationPageState();
}

class _SongRecommendationPageState extends State<SongRecommendationPage> {
  List<String> songs = [];
  List<String> songUrls = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchSongsForMood();
  }

  // Method to fetch songs from Last.fm API based on mood
  Future<void> fetchSongsForMood() async {
    final apiKey =
        'd815c18bd69927ff896ff2b9bfca04c5'; // Replace with your API key
    final moodTag = widget.mood.toLowerCase();
    final url =
        'https://ws.audioscrobbler.com/2.0/?method=tag.gettoptracks&tag=$moodTag&api_key=$apiKey&format=json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          isLoading = false;
          if (data['tracks']['track'] != null) {
            songs = List<String>.from(
                data['tracks']['track'].map((track) => track['name']));
            songUrls = List<String>.from(data['tracks']['track']
                .map((track) => track['url'])); // Last.fm URL for the song
          } else {
            errorMessage = 'No songs found for this mood.';
          }
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage =
              'Failed to load songs. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load songs: $e';
      });
    }
  }

  // Function to launch the song URL
  void launchSong(String songUrl) async {
    if (await canLaunch(songUrl)) {
      await launch(songUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open song URL.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.mood} Songs'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Show loading indicator
            : errorMessage.isNotEmpty
                ? Text(
                    errorMessage, // Display error message if there’s an issue
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )
                : ListView.builder(
                    itemCount: songs.length, // List of songs
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          songs[index], // Song name
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          launchSong(songUrls[index]); // Open the song URL
                        },
                      );
                    },
                  ),
      ),
    );
  }
}
