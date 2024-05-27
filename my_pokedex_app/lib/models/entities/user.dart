class User {
  String user;
  String password;
  List<String> amigos;
  List<String> pokemons;

  User({
    required this.user,
    required this.password,
    required this.amigos,
    required this.pokemons
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"],
        password: json["password"],
        amigos: List<String>.from(json['amigos']),
        pokemons: List<String>.from(json["pokemons"])
      );

  Map<String, dynamic> toJson() =>
      {
        "user": user,
        "password": password,
        "amigos": amigos,
        "pokemos": pokemons
      };
}
