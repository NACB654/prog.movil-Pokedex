import 'package:flutter/material.dart';

class FriendEntry extends StatelessWidget {
  final String name;
  final int pokemons;
  final String imageUrl;
  final VoidCallback onLongPress;

  FriendEntry({
    required this.name,
    required this.pokemons,
    required this.imageUrl,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
      margin: const EdgeInsets.all(8.0),
      color: const Color(0xFFF4F2F2),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListTile(
        leading: Image.asset(imageUrl == "" ? "assets/images/red.png" : imageUrl),
        title: Text(name),
        subtitle: Row(
          children: [
            Image.asset("assets/images/pokesprite.png"),
            const SizedBox(width: 10),
            Text(pokemons.toString()),
            const Text(" PkMNs")
          ],
        ),
      ),
    ),
    );
    
  }
}
