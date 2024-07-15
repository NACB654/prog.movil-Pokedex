import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/pages/detail/detail_page.dart';
import 'package:my_pokedex_app/services/usuario_service.dart';

class PokedexController extends GetxController {
  TextEditingController filterController = TextEditingController();
  UserService usuarioService = UserService();
  RxList<Pokemon> pokemons = RxList<Pokemon>([]);
  List<Pokemon> filterPokemons = [];

  void getPokemons(int usuarioId) async {
    List<Pokemon>? result = await usuarioService.getPokemons(usuarioId);
    pokemons = RxList<Pokemon>.from(result!);
  }

  void goToDetail(BuildContext context, Pokemon pokemonInfo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(pokemonInfo: pokemonInfo)));
  }
}
