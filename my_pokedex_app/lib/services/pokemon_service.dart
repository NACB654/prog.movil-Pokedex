import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_pokedex_app/models/entities/pokemon.dart';

class PokemonService {
  static const String apiUrl = "http://10.0.2.2:5000/pokemons";

  Future<Pokemon?> identifyPokemon(File photo, int userId) async {
    String url = "$apiUrl/identificar/$userId";

    try {
      final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "multipart/form-data"},
      body: jsonEncode(<String, File>{"file": photo}));

      if (response.statusCode == 201) {
        return Pokemon.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        print(jsonDecode(response.body).msg);

        return null;
      } else {
        print('Error: ${response.statusCode}');

        return null;
      }
    } catch (err, stackTrace) {
      print('Unexpected error: $err');
      print(stackTrace);

      return null;
    }
  }
}
