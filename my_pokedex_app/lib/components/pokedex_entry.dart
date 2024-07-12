import 'package:flutter/material.dart';
import 'package:my_pokedex_app/models/entities/tipo.dart';
import 'type_badge.dart';

class PokedexEntry extends StatelessWidget {
  final String number;
  final String name;
  final List<Tipo> types;
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
      margin: const EdgeInsets.all(8.0),
      color: const Color(0xFFF4F2F2),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
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
