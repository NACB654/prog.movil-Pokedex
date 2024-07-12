import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/services/usuario_service.dart';

class PokedexController extends GetxController {
  TextEditingController filterController = TextEditingController();
  UserService usuarioService = UserService();
  User usuario = User.empty();
  RxList<Pokemon> pokemons = RxList<Pokemon>([]);
  List<Pokemon> filterPokemons = [];

  // void getPokemons() async {
  //   userPokemons = await usuarioService.getPokemons(usuario.id);
  // }
}
