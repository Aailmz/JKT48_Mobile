import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jkt48show_mobile/provider.dart'; 
import 'package:jkt48show_mobile/models/room.dart';
import 'package:jkt48show_mobile/pages/room-detail.dart';

class RoomsListScreen extends StatefulWidget {
  @override
  _RoomsListScreenState createState() => _RoomsListScreenState();
}

class _RoomsListScreenState extends State<RoomsListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch rooms when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RoomsProvider>(context, listen: false).fetchRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RoomsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: Image.asset(
            'assets/images/icon/JKT48 Logo White.png', 
            width: 40, 
            height: 40, 
            fit: BoxFit.contain,
          ),
        ),
        title: Text('JKT48 Members'),
      ),
      body: provider.loading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75, // Adjust the aspect ratio to make cards taller
              ),
              itemCount: provider.rooms.length,
              itemBuilder: (context, index) {
                Room room = provider.rooms[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detail screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomDetailScreen(room: room), // Pass the room to the detail screen
                      ),
                    );
                  },
                  child: Container(
                    constraints: BoxConstraints(minHeight: 150), // Set a minimum height constraint
                    child: Card(
                      color: Color.fromARGB(255, 31, 43, 54), // Dark blue background
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Image.network(
                                room.imageUrl,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 100, // Adjusted height
                                    width: double.infinity,
                                    color: Colors.grey, // Placeholder color
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.white,
                                    ), // Icon indicating error
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    room.name,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // Light text color
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Followers: ${room.followerNum}',
                                    style: TextStyle(fontSize: 14.0, color: Colors.white70),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    'Live: ${room.isLive ? "Yes" : "No"}',
                                    style: TextStyle(fontSize: 12.0, color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
