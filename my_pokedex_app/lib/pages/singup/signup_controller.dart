import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/login/login_page.dart';
import 'package:my_pokedex_app/services/usuario_service.dart';
import 'dart:convert'; 

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  RxString message = ''.obs;
  var messageColor = Colors.red.obs;
  RxBool termsCheck = false.obs;
  RxString markdownData = ''.obs;



  final UserService userService = UserService();

  bool createAccount() {
    if (passwordController.text != password2Controller.text) {
      message.value = "Contraseña no coincide";
      return false;
    } else {
      message.value = '';
      return true;
    }
  }

  Future<void> getTerms() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/NACB654/prog.movil-Pokedex/main/README.md'));
    markdownData.value = response.body;
  }

  void aceptTerms(BuildContext context) {
    termsCheck.value = true;
    Navigator.pop(context);
  }

  void declineTerms(BuildContext context) {
    termsCheck.value = false;
    Navigator.pop(context);
  }
  
   void registerUser(BuildContext context) async {
    if (createAccount()) {
    User? userCreado = await userService.createUser(nameController.text, nicknameController.text, emailController.text, passwordController.text);
  
      if (userCreado != null) {
        message.value = "Registro exitoso";
        messageColor.value = Colors.green;
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(
          ),
        ),
      );
      } else {
        message.value = "Error en el registro";
        messageColor.value = Colors.red;
      }
    }
  }
  }

