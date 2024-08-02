import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models/theater.dart';
import 'models/room.dart';

class TheaterScheduleProvider with ChangeNotifier {
  TheaterScheduleService _service = TheaterScheduleService();
  List<TheaterSchedule> _schedules = [];
  bool _loading = false;

  List<TheaterSchedule> get schedules => _schedules;
  bool get loading => _loading;

  Future<void> fetchSchedules() async {
    _loading = true;
    notifyListeners();

    _schedules = await _service.fetchSchedules();

    _loading = false;
    notifyListeners();
  }
}

class RoomsProvider with ChangeNotifier {
  RoomsService _service = RoomsService();
  List<Room> _rooms = [];
  bool _loading = false;

  List<Room> get rooms => _rooms;
  bool get loading => _loading;

  Future<void> fetchRooms() async {
    _loading = true;
    notifyListeners();

    _rooms = await _service.fetchRooms();

    _loading = false;
    notifyListeners();
  }
}

