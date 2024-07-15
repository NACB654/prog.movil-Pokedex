class Ruta {
  int id;
  String name;
  int region_id;

  Ruta({
    required this.id,
    required this.name,
    required this.region_id,
  });

  factory Ruta.fromJson(Map<String, dynamic> json) {
    return Ruta(
        id: json['id'], name: json['name'], region_id: json['region_id']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'region_id': region_id};
  }
}
