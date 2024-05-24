import 'package:flutter/material.dart';
import 'type_badge.dart';

class PokedexEntry extends StatelessWidget {
  final String number;
  final String name;
  final List<String> types;
  final String imageUrl;

  PokedexEntry({
    required this.number,
    required this.name,
    required this.types,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text('$number $name'),
        subtitle: Row(
          children: types.map((type) => TypeBadge(type)).toList(),
        ),
      ),
    );
  }
}
