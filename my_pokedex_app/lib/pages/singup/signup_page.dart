import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:my_pokedex_app/pages/login/login_page.dart';
import 'package:my_pokedex_app/pages/singup/signup_controller.dart';
// import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Color backColor = const Color(0xFFF4F2F2);
  bool isKeyboardOpen = false;
  SignUpController control = SignUpController();

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        isKeyboardOpen = visible;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: backColor,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: isKeyboardOpen ? null : const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: isKeyboardOpen
                  ? MediaQuery.of(context).size.height -
                      MediaQuery.of(context).viewInsets.bottom
                  : MediaQuery.of(context).size.height - 150),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "Registrar cuenta",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
              const SizedBox(height: 15),
              _form(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child:
                MyTextField("Nombre completo", false, control.nameController),
          ),
          const SizedBox(height: 20),
           SizedBox(
          width: 300,
          child: MyTextField("Nickname", false, control.nicknameController),
        ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: MyTextField(
                "Correo electronico", false, control.emailController),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: MyTextField("Password", false, control.passwordController),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: MyTextField(
                "Repeat password", false, control.password2Controller),
          ),
          const SizedBox(height: 10),
          Obx(
            () => control.message.value == ''
                ? const SizedBox(height: 0)
                : Text(
                    control.message.value,
                    style: TextStyle(color: control.messageColor.value),
                  ),
          ),
          const SizedBox(height: 10),
          _mybutton(context, "Registrarse")
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Tu registro se ha realizado correctamente",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 120,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    backgroundColor: const Color(0xFFD2232A),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _mybutton(BuildContext context, String label) {
    return SizedBox(
      width: 200,
      child: TextButton(
        onPressed: () {
          control.registerUser(context).then((_) {
            if (control.message.value == "Registro exitoso") {
              _dialogBuilder(context);
            }
          });
        },
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
          backgroundColor: const Color(0xFFD2232A),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    control.getTerms();

    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: MyAppBar(backColor),
      ),
      body: _buildBody(context),
    ));
  }
}
