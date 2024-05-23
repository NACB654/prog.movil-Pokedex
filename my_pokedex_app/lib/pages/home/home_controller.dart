import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/pages/config/config_page.dart';
import 'package:my_pokedex_app/pages/friends/friends_page.dart';
import 'package:my_pokedex_app/pages/pokedex/pokedex_page.dart';

class HomeController extends GetxController {
  void goToPokedex(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PokedexPage()));
  }

  void goToEscanear(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FriendsPage()));
  }

  void goToFriends(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FriendsPage()));
  }

  void goToConfig(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfigPage()));
  }
}
