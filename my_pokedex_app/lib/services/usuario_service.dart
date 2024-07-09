import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/entities/user.dart';

class UserService {
  static const String apiUrl = 'https://localhost:5000';

  Future<User?> validateUser(String nickname, String password) async {
    String url = "$apiUrl/login";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['nickname'] = nickname;
    request.fields['password'] = password;

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        return User.fromJson(jsonDecode(responseBody));
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
