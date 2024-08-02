import 'package:flutter/material.dart';
import 'package:jkt48show_mobile/models/theater.dart';

class TheaterScheduleDetailScreen extends StatelessWidget {
  final TheaterSchedule schedule;

  TheaterScheduleDetailScreen({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(schedule.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the image with an outline
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2), // Outline color and width
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the image
                  child: Image.asset(
                    schedule.localImagePath,
                    fit: BoxFit.contain, // Fit the image while preserving aspect ratio
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              schedule.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change text color to white
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Room Name: ${schedule.roomName}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white, // Change text color to white
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Start At: ${DateTime.fromMillisecondsSinceEpoch(schedule.startAt * 1000)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[400], // Lighter grey for contrast
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Live: ${schedule.isOnLive ? "Yes" : "No"}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[400], // Lighter grey for contrast
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
