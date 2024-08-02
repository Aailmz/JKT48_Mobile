import 'package:flutter/material.dart';
import 'package:jkt48show_mobile/models/setlist.dart';

class SetlistSongsScreen extends StatelessWidget {
  final Setlist setlist;

  SetlistSongsScreen({required this.setlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setlist.name),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: setlist.songs.length,
        itemBuilder: (context, index) {
          Song song = setlist.songs[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LyricsScreen(song: song),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 8.0),
              color: Color.fromARGB(255, 31, 43, 54), // Dark blue background
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  song.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Light text color
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LyricsScreen extends StatelessWidget {
  final Song song;

  LyricsScreen({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SingleChildScrollView( // Make the content scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            Text(
              'Lyrics:',
              style: TextStyle(
                fontSize: 25.0,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              song.lyrics, // Display the song lyrics
              style: TextStyle(
                fontSize: 16.0,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
