import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/theater.dart';

class TheaterScheduleService {
  final String apiUrl = "http://localhost:8000/api/rooms/theater-schedule";

  Future<List<TheaterSchedule>> fetchSchedules() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => TheaterSchedule.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load theater schedules');
    }
  }
}
