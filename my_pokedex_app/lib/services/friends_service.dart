import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_pokedex_app/models/entities/friends.dart';

class FriendService {
  static const String baseUrl = 'http://localhost:5000';

  Future<List<Friend>> getFriends(String currentUserId) async {
    final response = await http.get(Uri.parse('$baseUrl/friends/get_friends?current_user_id=$currentUserId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Friend.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load friends');
    }
  }

  Future<Friend> searchFriend(String nickname) async {
    final response = await http.get(Uri.parse('$baseUrl/usuarios/search?nickname=$nickname'));

    if (response.statusCode == 200) {
      return Friend.fromJson(json.decode(response.body));
    } else {
      throw Exception('Friend not found');
    }
  }

  Future<void> addFriend(String currentUserId, String friendId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/friends/add_friend'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'current_user_id': currentUserId, 'friend_id': friendId}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add friend');
    }
  }

  Future<void> deleteFriend(String currentUserId, String friendId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/friends/delete_friend'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'current_user_id': currentUserId, 'friend_id': friendId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete friend');
    }
  }
}
