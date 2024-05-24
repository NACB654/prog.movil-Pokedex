import 'package:flutter/material.dart';

class TypeBadge extends StatelessWidget {
  final String type;

  TypeBadge(this.type);

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    switch (type) {
      case 'GRASS':
        badgeColor = const Color(0xFF3FA129);
        break;
      case 'POISON':
        badgeColor = const Color(0xFF9141CB);
        break;
      case 'FIRE':
        badgeColor = const Color(0xFFE62829);
        break;
      case 'WATER':
        badgeColor = const Color(0xFF2980EF);
        break;
      case 'ELECTRIC':
        badgeColor = const Color(0xFFFAC000);
        break;
      case 'NORMAL':
        badgeColor = const Color(0xFF9FA19F);
        break;
      case 'FAIRY':
        badgeColor = const Color(0xFFEF70EF);
        break;
      case 'PSYCHIC':
        badgeColor = const Color(0xFFEF4179);
        break;
      case 'GHOST':
        badgeColor = const Color(0xFF704170);
        break;
      case 'FIGHTING':
        badgeColor = const Color(0xFFF27900);
        break;
      case 'STEEL':
        badgeColor = const Color(0xFF60A1B8);
        break;
      case 'ICE':
        badgeColor = const Color(0xFF3DCEF3);
        break;
      case 'ROCK':
        badgeColor = const Color(0xFFAFA981);
        break;
      case 'GROUND':
        badgeColor = const Color(0xFF915121);
        break;
      case 'FLYING':
        badgeColor = const Color(0xFF6FB4F6);
        break;
      case 'BUG':
        badgeColor = const Color(0xFF91A119);
        break;
      case 'DARK':
        badgeColor = const Color(0xFF624D4E);
      case 'DRAGON':
        badgeColor = const Color(0xFF5060E1);
      default:
        badgeColor = const Color(0xFF7D817D);
    }

    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        type,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
