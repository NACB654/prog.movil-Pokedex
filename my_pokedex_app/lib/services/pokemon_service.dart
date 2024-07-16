import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_pokedex_app/models/entities/pokemon.dart';

class PokemonService {
  static const String apiUrl = "http://localhost:5000/pokemons";

  Future<Pokemon?> identifyPokemon(File photo, int userId) async {
    String url = "$apiUrl/identificar/$userId";

    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      final file = await http.MultipartFile.fromPath('file', photo.path);

      request.files.add(file);
      final streamResponse = await request.send();
      final response = await http.Response.fromStream(streamResponse);

      if (response.statusCode == 201) {
        return Pokemon.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        print(jsonDecode(response.body));

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
