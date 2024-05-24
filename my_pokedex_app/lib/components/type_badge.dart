import 'package:flutter/material.dart';

class TypeBadge extends StatelessWidget {
  final String type;

  TypeBadge(this.type);

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    switch (type) {
      case 'GRASS':
        badgeColor = Colors.green;
        break;
      case 'POISON':
        badgeColor = Colors.purple;
        break;
      case 'FIRE':
        badgeColor = Colors.red;
        break;
      case 'WATER':
        badgeColor = Colors.blue;
        break;
      case 'ELECTRIC':
        badgeColor = Colors.yellow;
        break;
      case 'NORMAL':
        badgeColor = Colors.grey;
        break;
      case 'FAIRY':
        badgeColor = Colors.pink;
        break;
      case 'PSYCHIC':
        badgeColor = Colors.purpleAccent;
        break;
      case 'GHOST':
        badgeColor = Colors.deepPurple;
        break;
      case 'FIGHTING':
        badgeColor = Colors.brown;
        break;
      case 'STEEL':
        badgeColor = Colors.blueGrey;
        break;
      default:
        badgeColor = Colors.black;
    }

    return Container(
      margin: EdgeInsets.only(right: 4.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        type,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
