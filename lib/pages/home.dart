import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/event.png',
    'assets/images/event2.png',
    'assets/images/event3.png',
    'assets/images/event4.png',
    'assets/images/event5.png',
  ];

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
        title: Text('JKT48 Mobile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Make the content scrollable
          child: Center( // Centering the entire content
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize the height of the column
              crossAxisAlignment: CrossAxisAlignment.center, // Center the items horizontally
              children: [
                // Welcome text
                Text(
                  'Welcome to JKT48 Mobile!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 15.0),
                // Image carousel
                CarouselSlider.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                      width: 300,
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true, // Enable automatic sliding
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                  ),
                ),
                SizedBox(height: 35.0),
                Text(
                  'Experience the ultimate connection with your favorite JKT48 members and stay updated with the latest events and schedules.',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 221, 221, 221)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25.0),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 221, 221, 221)),
                    children: [
                      TextSpan(
                        text: 'Explore and immerse yourself in the world of JKT48 by purchasing tickets and events on ',
                      ),
                      
                      TextSpan(
                        text: 'www.jkt48.com',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue, // Change the color to blue to indicate it's a link
                          decoration: TextDecoration.underline, // Underline the text
                        ),
                        recognizer: TapGestureRecognizer() // Make it clickable
                          ..onTap = () {
                            // Handle the tap event, e.g., launch a URL
                            launch('https://www.jkt48.com');
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Center text alignment
                ),
                SizedBox(height: 25.0), 
                Text(
                  'JKT48 Theater',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 221, 221, 221)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0), 
                Image.asset(
                      'assets/images/theater.jpeg', // Path to your second image in assets
                      height: 200, // Fixed height
                      width: 300, // Fixed width
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16.0), 
                Text(
                  'Join for an unforgettable experience at the JKT48 theater, and immerse yourself in the vibrant world of JKT48!',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 221, 221, 221)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0), 
                GestureDetector(
                  onTap: () async {
                    const url = 'https://maps.app.goo.gl/28RZfV9YDdxXvCu99'; // Ganti dengan URL yang ingin Anda buka
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset(
                    'assets/images/maps.png', // Path to your image in assets
                    height: 100, // Fixed height
                    width: 300, // Fixed width
                    fit: BoxFit.cover,
                  ),
                ),
                    SizedBox(height: 16.0), 
                Text(
                  'Jl. Jenderal Sudirman No.1, RT.1/RW.3, Gelora, Tanah Abang, Central Jakarta 10270',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 221, 221, 221)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
