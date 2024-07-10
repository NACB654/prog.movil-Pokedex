import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';

class DetailController extends GetxController {
  
  Pokemon prueba = Pokemon(
      id: 1,
      nombre: "Bulbasaur",
      numero: 1,
      peso: 6.9,
      altura: 0.7,
      descripcion:
          "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.",
      ataque: 49,
      defensa: 49,
      ataqueEspecial: 65,
      defensaEspecial: 65,
      velocidad: 45,
      audioUrl: "",
      imagenUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      spriteUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      tipos: ["GRASS", "POISON"]);
}
