import 'package:flutter/material.dart';
import 'package:jkt48show_mobile/models/room.dart';

class RoomDetailScreen extends StatelessWidget {
  final Room room;

  RoomDetailScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room.name), // Set the title to the room name
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room Image
            Image.network(
              room.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey, // Placeholder color
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                  ), // Icon indicating error
                );
              },
            ),
            SizedBox(height: 16.0),

            // Room Name
            Text(
              room.name,
              style: TextStyle(
                fontSize: 28.0, // Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change to white
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                  ),
                ], // Added shadow for better visibility
              ),
            ),
            SizedBox(height: 8.0),

            // Followers Count
            Text(
              'Followers: ${room.followerNum}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white70, // Change to a lighter white
              ),
            ),
            SizedBox(height: 4.0),

            // Live Status
            Text(
              'Live: ${room.isLive ? "Yes" : "No"}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white70, // Change to a lighter white
              ),
            ),
            SizedBox(height: 16.0),

            // Room Description
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change to white
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              room.description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white70, // Change to a lighter white
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 31, 43, 54), // Dark background for the detail screen
    );
  }
}
