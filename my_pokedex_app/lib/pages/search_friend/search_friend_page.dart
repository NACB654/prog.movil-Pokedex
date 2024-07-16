import 'package:flutter/material.dart';
import 'package:my_pokedex_app/models/entities/friends.dart';
import 'package:my_pokedex_app/components/friend_entry.dart';

class SearchResultPage extends StatelessWidget {
  final Friend friend;
  final String currentUserId;

  SearchResultPage({required this.friend, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Amigos'),
        backgroundColor: Color(0xFFF4F2F2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FriendEntry(
              name: friend.nickname,
              pokemons: 0, // Ajusta esto según tus necesidades
              imageUrl: friend.imagenUrl,
              onLongPress: () {},
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, friend);
              },
              child: Text('Agregar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
