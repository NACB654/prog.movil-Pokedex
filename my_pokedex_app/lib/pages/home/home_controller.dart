import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/config/config_page.dart';
import 'package:my_pokedex_app/pages/friends/friends_page.dart';
import 'package:my_pokedex_app/pages/pokedex/pokedex_page.dart';

class HomeController extends GetxController {
  void goToPokedex(BuildContext context, User userInfo) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PokedexPage(userInfo: userInfo,)));
  }

  void goToEscanear(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfigPage()));
  }

  void goToFriends(BuildContext context, User userInfo) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FriendsPage(userInfo: userInfo,)));
  }

  void goToConfig(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfigPage()));
  }
}
