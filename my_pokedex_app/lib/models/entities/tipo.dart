class Tipo {
  int id;
  String name;

  Tipo({
    required this.id,
    required this.name,
  });

  factory Tipo.fromJson(Map<String, dynamic> json) {
    return Tipo(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
