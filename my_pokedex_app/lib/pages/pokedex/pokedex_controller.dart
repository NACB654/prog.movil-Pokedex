import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/services/usuario_service.dart';

class PokedexController extends GetxController {
  TextEditingController filterController = TextEditingController();
  UserService usuario_service = UserService();
  var pokemons = <Pokemon>[].obs;
  List<Pokemon> filterPokemons = [];
  Future<List<Pokemon>?> getPokemons(int usuarioId) {
    return usuario_service.getPokemons(usuarioId);
  }
}
