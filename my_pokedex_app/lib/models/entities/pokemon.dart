class Pokemon {
  int id;
  String nombre;
  int numero;
  double peso;
  double altura;
  String descripcion;
  int ataque;
  int defensa;
  int ataqueEspecial;
  int defensaEspecial;
  int velocidad;
  String audioUrl;
  String imagenUrl;
  String spriteUrl;
  List<String> tipos;

  Pokemon({
    required this.id,
    required this.nombre,
    required this.numero,
    required this.peso,
    required this.altura,
    required this.descripcion,
    required this.ataque,
    required this.defensa,
    required this.ataqueEspecial,
    required this.defensaEspecial,
    required this.velocidad,
    required this.audioUrl,
    required this.imagenUrl,
    required this.spriteUrl,
    required this.tipos,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      nombre: json['nombre'],
      numero: json['numero'],
      peso: json['peso'],
      altura: json['altura'],
      descripcion: json['descripcion'],
      ataque: json['ataque'],
      defensa: json['defensa'],
      ataqueEspecial: json['ataqueEspecial'],
      defensaEspecial: json['defensaEspecial'],
      velocidad: json['velocidad'],
      audioUrl: json['audioUrl'],
      imagenUrl: json['imagenUrl'],
      spriteUrl: json['spriteUrl'],
      tipos: List<String>.from(json['tipos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'numero': numero,
      'peso': peso,
      'altura': altura,
      'descripcion': descripcion,
      'ataque': ataque,
      'defensa': defensa,
      'ataqueEspecial': ataqueEspecial,
      'defensaEspecial': defensaEspecial,
      'velocidad': velocidad,
      'audioUrl': audioUrl,
      'imagenUrl': imagenUrl,
      'spriteUrl': spriteUrl,
      'tipos': tipos,
    };
  }
}
