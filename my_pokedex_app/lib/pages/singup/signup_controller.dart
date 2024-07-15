import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/login/login_page.dart';
import 'package:my_pokedex_app/services/usuario_service.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  RxString message = ''.obs;
  var messageColor = Colors.red.obs;

  final UserService userService = UserService();

  bool validatePassword() {
    if (passwordController.text != password2Controller.text) {
      message.value = "Contraseña no coincide";
      return false;
    } else {
      message.value = '';
      return true;
    }
  }

  void registerUser(BuildContext context) async {
    if (validatePassword()) {
      Map<String, String> newUser = {
        "name": nameController.text,
        "last_name": lastNameController.text,
        "nickname": nicknameController.text,
        "email": emailController.text,
        "password": passwordController.text
      };

      User? userCreado = await userService.createUser(newUser);

      if (userCreado != null) {
        message.value = "Registro exitoso";
        messageColor.value = Colors.green;
      } else {
        message.value = "Error en el registro";
        messageColor.value = Colors.red;
      }
    }
  }
}
