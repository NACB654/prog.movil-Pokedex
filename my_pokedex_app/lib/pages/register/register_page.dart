import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_buttons.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                "Crear Cuenta",
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
          SizedBox(width: 300, child: MyTextField("Nombre completo", false)),
          const SizedBox(height: 20),
          SizedBox(width: 300, child: MyTextField("Correo Electrónico", false)),
          const SizedBox(height: 20),
          SizedBox(width: 300, child: MyTextField("Contraseña", true)),
          const SizedBox(height: 20),
          SizedBox(width: 300, child: MyTextField("Repetir Contraseña", true)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your registration logic here
            },
            child: const Text('Registrar'),
          ),
        ],
      ),
    );
  }

  Widget _links(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the login page
            Navigator.pop(context);
          },
          child: const Text(
            "Iniciar Sesión",
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
