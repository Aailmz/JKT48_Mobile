import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'models/theater.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TheaterScheduleProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JKT48 Theater Schedule',
      home: TheaterScheduleListScreen(),
    );
  }
}

class TheaterScheduleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TheaterScheduleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('JKT48 Theater Schedule'),
      ),
      body: provider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.schedules.length,
              itemBuilder: (context, index) {
                TheaterSchedule schedule = provider.schedules[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(schedule.imageUrl),
                    title: Text(schedule.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Room Name: ${schedule.roomName}'),
                        Text('Start At: ${DateTime.fromMillisecondsSinceEpoch(schedule.startAt * 1000)}'),
                        Text('Live: ${schedule.isOnLive ? "Yes" : "No"}'),
                      ],
                    ),
                    onTap: () {
                      // Add action on tap, such as navigating to the detailed page or opening the entrance URL
                      // For example:
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedScreen(schedule: schedule)));
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.fetchSchedules,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
