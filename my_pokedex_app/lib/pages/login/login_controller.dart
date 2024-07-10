import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex_app/pages/home/home_page.dart';
import 'package:my_pokedex_app/pages/singup/signup_page.dart';
import 'package:my_pokedex_app/services/usuario_service.dart';
import '../../models/entities/user.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString message = "".obs;
  var messageColor = Colors.red.obs;

  final UserService userService = UserService();

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void loginAccount(BuildContext context) async {
    User? userFound = await findUser();

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
      messageColor.value = Colors.red;
    }
  }

  Future<User?> findUser() async {
    String email= emailController.text;
    String password = passwordController.text;

    return await userService.validateUser(email, password);
  }
}
