import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/config/config_page.dart';
import 'package:my_pokedex_app/pages/friends/friends_page.dart';
import 'package:my_pokedex_app/pages/pokedex/pokedex_page.dart';
import 'package:my_pokedex_app/services/pokemon_service.dart';

class HomeController extends GetxController {
  PokemonService pokemonService = PokemonService();

  void goToPokedex(BuildContext context, User userInfo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokedexPage(
                  userInfo: userInfo,
                )));
  }

  Future<Pokemon?> goToEscanear(BuildContext context, int userId) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      Pokemon? newPokemon = await identifyPokemon(file, userId);

      if (newPokemon != null) {
        return newPokemon;
      } else {
        return null;
      }
    }
  }

  void goToFriends(BuildContext context, User userInfo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FriendsPage(
                  userInfo: userInfo,
                )));
  }

  void goToConfig(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfigPage()));
  }

  Future<Pokemon?> identifyPokemon(File photo, int userId) async {
    return await pokemonService.identifyPokemon(photo, userId);
  }
}
