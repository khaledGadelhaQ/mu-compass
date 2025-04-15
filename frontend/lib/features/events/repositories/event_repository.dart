import 'package:collage_campus/core/services/api_services.dart';

class EventRepository {
  final ApiService _api = ApiService();

  Future<List<dynamic>> getAllEvents() async {
    final response = await _api.get('/api/events');
    return response['data']; // or response directly if there's no "data" field
  }
}
