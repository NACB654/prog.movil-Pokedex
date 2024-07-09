import 'package:my_pokedex_app/models/entities/pokemon.dart';

class User {
  int id;
  String name;
  String lastName;
  String nickname;
  String email;
  String password;
  String? imagenUrl; // Puede ser null
  List<Pokemon> pokemons; 

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.nickname,
    required this.email,
    required this.password,
    this.imagenUrl,
    required this.pokemons,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        nickname: json["nickname"],
        email: json["email"],
        password: json["password"],
        imagenUrl: json["imagen_url"],
        pokemons: List<Pokemon>.from(json["pokemons"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "nickname": nickname,
        "email": email,
        "password": password,
        "imagen_url": imagenUrl,
        "pokemons": List<dynamic>.from(pokemons.map((x) => x.toJson())),
      };
}
