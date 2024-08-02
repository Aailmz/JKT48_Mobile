import 'package:flutter/material.dart';
import 'package:jkt48show_mobile/pages/home.dart';
import 'package:jkt48show_mobile/pages/room-onlives.dart';
import 'package:jkt48show_mobile/pages/setlist-list.dart';
import 'package:jkt48show_mobile/pages/theater-schedule.dart';
import 'package:jkt48show_mobile/pages/room-list.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TheaterScheduleProvider()),
        ChangeNotifierProvider(create: (_) => RoomsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; 

  final List<Widget> _screens = [
    HomeScreen(),
    TheaterScheduleListScreen(),
    SetlistScreen(),
    RoomsListScreen(), 
    RoomsonlivesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JKT48 Mobile',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF121212),
        cardColor: Color(0xFF2c3e50),
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 80, 10, 10),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: const Color.fromARGB(179, 133, 0, 0)),
          bodyText2: TextStyle(color: Colors.white70),
        ),
      ),
      home: Scaffold(
        body: _screens[_currentIndex], // Display the current screen
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // Theater Schedule
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Schedule', // Theater Schedule
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Setlist', // Rooms
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Members', // Rooms
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.broadcast_on_home),
              label: 'On Live', // Rooms
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped, // Handle tap events
        ),
      ),
    );
  }
}
