import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_buttons.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color backColor = const Color(0xFFF4F2F2);
  bool isKeyboardOpen = false;

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
              const SizedBox(height: 20),
              _image(context),
              const Text(
                "Mi Pokédex",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
              const SizedBox(height: 30),
              const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              _form(context),
              const SizedBox(height: 10),
              _links(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/pokeball.png"),
            fit: BoxFit.contain),
      ),
      height: 80,
      child: null,
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(width: 300, child: MyTextField("Usuario", false)),
          const SizedBox(height: 20),
          SizedBox(width: 300, child: MyTextField("Password", false)),
          const SizedBox(height: 20),
          MyButtons()
        ],
      ),
    );
  }

  Widget _links(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Crear Cuenta",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD2232A),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Recuperar Contraseña",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD2232A),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
