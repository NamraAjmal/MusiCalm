import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SongRecommendationPage extends StatefulWidget {
  final String mood;
  final Color moodColor;

  const SongRecommendationPage({
    required this.mood,
    required this.moodColor,
  });

  @override
  _SongRecommendationPageState createState() => _SongRecommendationPageState();
}

class _SongRecommendationPageState extends State<SongRecommendationPage> {
  List<String> songs = [];
  List<String> songUrls = [];
  bool isLoading = true;
  String errorMessage = '';
  int? hoveredIndex;

  @override
  void initState() {
    super.initState();
    fetchSongsForMood();
  }

  Future<void> fetchSongsForMood() async {
    final apiKey = 'd815c18bd69927ff896ff2b9bfca04c5';
    final moodTag = widget.mood.toLowerCase();
    final url =
        'https://ws.audioscrobbler.com/2.0/?method=tag.gettoptracks&tag=$moodTag&api_key=$apiKey&format=json';

    try {
      final response = await http.get(Uri.parse(url));

      // print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          isLoading = false;
          if (data['tracks']['track'] != null) {
            songs = List<String>.from(
                data['tracks']['track'].map((track) => track['name']));
            songUrls = List<String>.from(
                data['tracks']['track'].map((track) => track['url']));
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '${widget.mood} Songs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          isLoading
              ? Center(child: CircularProgressIndicator())
              : errorMessage.isNotEmpty
                  ? Center(
                      child: Text(
                        errorMessage,
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              hoveredIndex = index;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              hoveredIndex = null;
                            });
                          },
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            tileColor: hoveredIndex == index
                                ? Colors.grey.shade800
                                : Colors.black,
                            title: Text(
                              songs[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: hoveredIndex == index
                                    ? Colors.green
                                    : widget.moodColor,
                                fontWeight: hoveredIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                launchSong(songUrls[index]);
                              },
                            ),
                            onTap: () {
                              launchSong(songUrls[index]);
                            },
                          ),
                        );
                      },
                    ),
        ],
      ),
    );
  }
}
