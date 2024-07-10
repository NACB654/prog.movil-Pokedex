import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/entities/user.dart';

class UserService {
  static const String apiUrl = 'http://10.0.2.2:5000/usuarios';

  Future<User?> validateUser(String email, String password) async {
    String url = "$apiUrl/login";

    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              <String, String>{"email": email, "password": password}));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        print('User not found');

        return null;
      } else {
        print('Error: ${response.statusCode}');

        return null;
      }
    } catch (e, stackTrace) {
      print('Unexpected error: $e');
      print(stackTrace);

      return null;
    }
  }
}
