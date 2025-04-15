import "package:collage_campus/core/services/api_services.dart";

class AuthRepository {
  final ApiService _api = ApiService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };
    return await _api.post('/api/auth/login', body);
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final body = {
      'name': name,
      'email': email,
      'password': password,
    };
    return await _api.post('/api/auth/register', body);
  }
}
