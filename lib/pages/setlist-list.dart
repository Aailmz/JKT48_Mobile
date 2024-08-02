import 'package:flutter/material.dart';
import 'package:jkt48show_mobile/models/setlist.dart';
import 'package:jkt48show_mobile/pages/setlist-songs-screen.dart';

class SetlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Text('JKT48 Setlist'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: setlists.length,
        itemBuilder: (context, index) {
          Setlist setlist = setlists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetlistSongsScreen(setlist: setlist),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: Card(
                color: Color.fromARGB(255, 31, 43, 54), // Dark blue background
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          setlist.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey, // Placeholder color
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                              ), // Icon indicating error
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          setlist.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Light text color
                          ),
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
