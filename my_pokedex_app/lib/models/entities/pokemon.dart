class Pokemon {
  int id;
  String name;
  int index;
  double weight;
  double height;
  String description;
  int attack;
  int defense;
  int sp_attack;
  int sp_defense;
  int speed;
  String audio_url;
  String imagen_url;
  String sprite_url;
  List<String> tipos;

  Pokemon({
    required this.id,
    required this.name,
    required this.index,
    required this.weight,
    required this.height,
    required this.description,
    required this.attack,
    required this.defense,
    required this.sp_attack,
    required this.sp_defense,
    required this.speed,
    required this.audio_url,
    required this.imagen_url,
    required this.sprite_url,
    required this.tipos,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      index: json['index'],
      weight: json['weight'],
      height: json['height'],
      description: json['description'],
      attack: json['attack'],
      defense: json['defense'],
      sp_attack: json['sp_attack'],
      sp_defense: json['sp_defense'],
      speed: json['speed'],
      audio_url: json['audio_url'],
      imagen_url: json['imagen_url'],
      sprite_url: json['sprite_url'],
      tipos: List<String>.from(json['tipos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'index': index,
      'weight': weight,
      'height': height,
      'description': description,
      'attack': attack,
      'defense': defense,
      'sp_attack': sp_attack,
      'sp_defense': sp_defense,
      'speed': speed,
      'audio_url': audio_url,
      'imagen_url': imagen_url,
      'sprite_url': sprite_url,
      'tipos': tipos,
    };
  }
}
