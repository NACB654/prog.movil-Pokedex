import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';

class PokedexController extends GetxController {
  TextEditingController filterController = TextEditingController();
  var pokemons = <Pokemon>[].obs;

    @override
  void onInit() {
    super.onInit();
    loadPokemon();
  }

  void loadPokemon() {
    var data = [
    {
    "id": 1,
    "nombre": "Bulbasaur",
    "numero": 1,
    "peso": 6.9,
    "altura": 0.7,
    "descripcion": "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.",
    "ataque": 49,
    "defensa": 49,
    "ataqueEspecial": 65,
    "defensaEspecial": 65,
    "velocidad": 45,
    "audioUrl": "https://example.com/audio/bulbasaur.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
    "tipos": ["GRASS", "POISON"]
  },
  {
    "id": 4,
    "nombre": "Charmander",
    "numero": 4,
    "peso": 8.5,
    "altura": 0.6,
    "descripcion": "Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.",
    "ataque": 52,
    "defensa": 43,
    "ataqueEspecial": 60,
    "defensaEspecial": 50,
    "velocidad": 65,
    "audioUrl": "https://example.com/audio/charmander.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
    "tipos": ["FIRE"]
  },
  {
    "id": 7,
    "nombre": "Squirtle",
    "numero": 7,
    "peso": 9.0,
    "altura": 0.5,
    "descripcion": "After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.",
    "ataque": 48,
    "defensa": 65,
    "ataqueEspecial": 50,
    "defensaEspecial": 64,
    "velocidad": 43,
    "audioUrl": "https://example.com/audio/squirtle.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
    "tipos": ["WATER"]
  },
  {
    "id": 25,
    "nombre": "Pikachu",
    "numero": 25,
    "peso": 6.0,
    "altura": 0.4,
    "descripcion": "When several of these Pokémon gather, their electricity could build and cause lightning storms.",
    "ataque": 55,
    "defensa": 40,
    "ataqueEspecial": 50,
    "defensaEspecial": 50,
    "velocidad": 90,
    "audioUrl": "https://example.com/audio/pikachu.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
    "tipos": ["ELECTRIC"]
  },
  {
    "id": 39,
    "nombre": "Jigglypuff",
    "numero": 39,
    "peso": 5.5,
    "altura": 0.5,
    "descripcion": "When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep.",
    "ataque": 45,
    "defensa": 20,
    "ataqueEspecial": 45,
    "defensaEspecial": 25,
    "velocidad": 20,
    "audioUrl": "https://example.com/audio/jigglypuff.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png",
    "tipos": ["NORMAL", "FAIRY"]
  },
  {
    "id": 52,
    "nombre": "Meowth",
    "numero": 52,
    "peso": 4.2,
    "altura": 0.4,
    "descripcion": "Adores circular objects. Wanders the streets on a nightly basis to look for dropped loose change.",
    "ataque": 45,
    "defensa": 35,
    "ataqueEspecial": 40,
    "defensaEspecial": 40,
    "velocidad": 90,
    "audioUrl": "https://example.com/audio/meowth.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png",
    "tipos": ["NORMAL"]
  },
  {
    "id": 150,
    "nombre": "Mewtwo",
    "numero": 150,
    "peso": 122.0,
    "altura": 2.0,
    "descripcion": "It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.",
    "ataque": 110,
    "defensa": 90,
    "ataqueEspecial": 154,
    "defensaEspecial": 90,
    "velocidad": 130,
    "audioUrl": "https://example.com/audio/mewtwo.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
    "tipos": ["PSYCHIC"]
  },
  {
    "id": 151,
    "nombre": "Mew",
    "numero": 151,
    "peso": 4.0,
    "altura": 0.4,
    "descripcion": "So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.",
    "ataque": 100,
    "defensa": 100,
    "ataqueEspecial": 100,
    "defensaEspecial": 100,
    "velocidad": 100,
    "audioUrl": "https://example.com/audio/mew.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png",
    "tipos": ["PSYCHIC"]
  },
  {
    "id": 200,
    "nombre": "Misdreavus",
    "numero": 200,
    "peso": 1.0,
    "altura": 0.7,
    "descripcion": "It likes playing mischievous tricks such as screaming and wailing to startle people at night.",
    "ataque": 60,
    "defensa": 60,
    "ataqueEspecial": 85,
    "defensaEspecial": 85,
    "velocidad": 85,
    "audioUrl": "https://example.com/audio/misdreavus.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/200.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/200.png",
    "tipos": ["GHOST"]
  },
  {
    "id": 448,
    "nombre": "Lucario",
    "numero": 448,
    "peso": 54.0,
    "altura": 1.2,
    "descripcion": "A well-trained one can sense auras to identify and take in the feelings of creatures over half a mile away.",
    "ataque": 110,
    "defensa": 70,
    "ataqueEspecial": 115,
    "defensaEspecial": 70,
    "velocidad": 90,
    "audioUrl": "https://example.com/audio/lucario.mp3",
    "imagenUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/448.png",
    "spriteUrl": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/448.png",
    "tipos": ["FIGHTING", "STEEL"]
  }
];

pokemons.value = data.map((e) => Pokemon.fromJson(e)).toList();

}

}
