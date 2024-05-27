import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex_app/pages/home/home_page.dart';
import 'package:my_pokedex_app/pages/singup/signup_page.dart';
import '../../models/entities/user.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString message = "".obs;
  var messageColor = Colors.red.obs;

  List<User> users = [
    User(user: "AshKetchum", password: "pikachu123", amigos: [
      "MistyWater",
      "BrockRock"
    ], pokemons: [
      "Pikachu",
      "Charmander",
      "Bulbasaur",
      "Squirtle",
      "Jigglypuff",
      "Meowth",
      "Mewtwo",
      "Mew"
    ]),
    User(
        user: "MistyWater",
        password: "starmie456",
        amigos: ["AshKetchum", "BrockRock"],
        pokemons: ["Squirtle", "Misdreavus", "Jigglypuff", "Cleffa", "Eevee"]),
  ];

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void loginAccount(BuildContext context) {
    User? userFound = findUser();

    if (userFound != null) {
      message.value = '';
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            userInfo: userFound,
          ),
        ),
      );
    } else {
      message.value = 'Usuario incorrecto';
    }
  }

  User? findUser() {
    String user = userController.text;
    String password = passwordController.text;

    for (User u in users) {
      if (u.user == user && u.password == password) {
        return u;
      }
    }

    return null;
  }
}
