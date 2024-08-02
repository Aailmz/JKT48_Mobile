import 'package:flutter/material.dart';
import 'package:jkt48show_mobile/pages/theater-schedule-detail.dart';
import 'package:provider/provider.dart';
import 'package:jkt48show_mobile/provider.dart';
import 'package:jkt48show_mobile/models/theater.dart';

class TheaterScheduleListScreen extends StatefulWidget {
  @override
  _TheaterScheduleListScreenState createState() => _TheaterScheduleListScreenState();
}

class _TheaterScheduleListScreenState extends State<TheaterScheduleListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch schedules when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TheaterScheduleProvider>(context, listen: false).fetchSchedules();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TheaterScheduleProvider>(context);

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
        title: Text('JKT48 Theater Schedule'),
      ),
      body: provider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: provider.schedules.length,
              itemBuilder: (context, index) {
                TheaterSchedule schedule = provider.schedules[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: Color.fromARGB(255, 31, 43, 54), // Dark blue background
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Image.asset(
                            schedule.localImagePath,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            // Optionally handle image errors here
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schedule.title,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Light text color
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Room Name: ${schedule.roomName}',
                                  style: TextStyle(fontSize: 16.0, color: Colors.white70),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Start At: ${DateTime.fromMillisecondsSinceEpoch(schedule.startAt * 1000)}',
                                  style: TextStyle(fontSize: 14.0, color: Colors.white70),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Live: ${schedule.isOnLive ? "Yes" : "No"}',
                                  style: TextStyle(fontSize: 14.0, color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                  backgroundColor: Colors.blue,
                                  primary: Colors.white,
                                  textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TheaterScheduleDetailScreen(schedule: schedule),
                                    ),
                                  );
                                },
                                child: Text('DETAILS'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
