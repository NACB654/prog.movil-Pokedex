import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  RxString message = ''.obs;
  var messageColor = Colors.red.obs;
  RxBool termsCheck = false.obs;
  RxString markdownData = ''.obs;

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
}
