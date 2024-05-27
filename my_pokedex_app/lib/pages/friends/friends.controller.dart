import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex_app/models/entities/friends.dart';

class FriendController extends GetxController {
  TextEditingController filterController = TextEditingController();
  List<Friend> filterFriend = [];

  List<Friend> friends = [
    Friend(
        username: "AshKetchum",
        imagenUrl:
            "assets/images/red.png",
        pokemons: 3),
    Friend(
        username: "MistyWater",
        imagenUrl:
            "assets/images/misty.png",
        pokemons: 5),
    Friend(
        username: "BrockRock",
        imagenUrl:
            "assets/images/brock.png",
        pokemons: 4)
  ];
}
