class Friend {
  String username;
  String imagenUrl;
  int pokemons;

  Friend({
    required this.username,
    required this.imagenUrl,
    required this.pokemons
  });

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        username: json["user"],
        imagenUrl: json['imagenUrl'],
        pokemons: json["pokemons"]
      );

  Map<String, dynamic> toJson() =>
      {
        "user": username,
        "imagenUrl": imagenUrl,
        "pokemons": pokemons
      };
}
