class Friend {
  final int id;
  final String imagenUrl;
  final String nickname;

  Friend({
    required this.id,
    required this.imagenUrl,
    required this.nickname,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'] ?? 0,
      imagenUrl: json['imagen_url'] ?? '',
      nickname: json['nickname'] ?? '',
    );
  }
}
