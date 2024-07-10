class Ability {
  int id;
  String name;

  Ability({required this.id, required this.name});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(id: json["id"], name: json["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
