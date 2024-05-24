class TipoPokemon {
  int id;
  int pokemonId;
  int tipoId;

  TipoPokemon({
    required this.id,
    required this.pokemonId,
    required this.tipoId,
  });

  factory TipoPokemon.fromJson(Map<String, dynamic> json) {
    return TipoPokemon(
      id: json['id'],
      pokemonId: json['pokemonId'],
      tipoId: json['tipoId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pokemonId': pokemonId,
      'tipoId': tipoId,
    };
  }
}
