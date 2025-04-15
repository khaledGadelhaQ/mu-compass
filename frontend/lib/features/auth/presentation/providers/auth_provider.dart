import 'package:flutter/material.dart';
import 'package:collage_campus/features/auth/data/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _repo = AuthRepository();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.login(email, password);
      print("Login Success: $response");

      // Save token or user data if needed

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.register(name, email, password);
      print("Register Success: $response");

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
