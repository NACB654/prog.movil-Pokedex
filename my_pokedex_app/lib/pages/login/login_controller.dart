import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex_app/pages/home/home_page.dart';
import 'package:my_pokedex_app/pages/singup/signup_page.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString message = "".obs;
  var messageColor = Colors.red.obs;

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void loginAccount(BuildContext context) {
    String user = userController.text;
    String password = passwordController.text;

    if (user == "hola" && password == "123") {
      message.value = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      message.value = 'Usuario incorrecto';
    }
  }
}
