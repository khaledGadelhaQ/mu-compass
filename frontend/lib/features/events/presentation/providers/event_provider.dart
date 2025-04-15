import 'package:flutter/material.dart';
import 'package:collage_campus/features/events/repositories/event_repository.dart';

class EventProvider with ChangeNotifier {
  final EventRepository _repo = EventRepository();
  List<dynamic> events = [];

  Future<void> fetchEvents() async {
    events = await _repo.getAllEvents();
    notifyListeners();
  }
}
