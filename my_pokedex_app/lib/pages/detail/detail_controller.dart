import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/habilidad.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/models/entities/tipo.dart';

class DetailController extends GetxController {
  Pokemon prueba = Pokemon(
      id: 1,
      name: "Bulbasaur",
      index: 1,
      weight: 6,
      height: 0,
      description:
          "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.",
      attack: 49,
      defense: 49,
      sp_attack: 65,
      sp_defense: 65,
      speed: 45,
      audio_url: "",
      imagen_url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      sprite_url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      tipos: [Tipo(id: 1, name: "GRASS"), Tipo(id: 2, name: "POISON")],
      habilidades: [Ability(id: 1, name: "Chlorophyl")]);
}
