import 'package:flutter/material.dart';
import 'package:my_pokedex_app/models/entities/friends.dart';
import 'package:my_pokedex_app/services/friends_service.dart';

class FriendController {
  TextEditingController filterController = TextEditingController();
  List<Friend> filterFriend = [];
  List<Friend> _friends = [];
  FriendService _friendService = FriendService();

  Future<void> fetchFriends(String userId) async {
    try {
      _friends = await _friendService.getFriends(userId);
    } catch (e) {
      print('Failed to load friends: $e');
      _friends = [];
    }
  }

  Future<Friend> searchFriend(String nickname) async {
    try {
      return await _friendService.searchFriend(nickname);
    } catch (e) {
      print('Failed to search friend: $e');
      throw e;
    }
  }

  Future<void> addFriend(String currentUserId, String friendId) async {
    try {
      await _friendService.addFriend(currentUserId, friendId);
    } catch (e) {
      print('Failed to add friend: $e');
      throw e;
    }
  }

  Future<void> deleteFriend(String currentUserId, String friendId) async {
    try {
      await _friendService.deleteFriend(currentUserId, friendId);
    } catch (e) {
      print('Failed to delete friend: $e');
      throw e;
    }
  }

  List<Friend> get friends => _friends;

  void dispose() {
    filterController.dispose();
  }
}
