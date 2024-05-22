import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_buttons.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      //CONTAINER GENERAL
      color: backColor,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(children: [
        Container(
            //COLUMNA DIVIDE MITAD / MITAD
            child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/images/btn_pokedex.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 100,
              width: 345,
              child: Row(
                // FILA INFERIOR
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/btn_escanear.png",
                      fit: BoxFit.cover, //MODIFICAR PA Q ENCAJE
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: // TEMPORALA
                            Image.asset(
                          "assets/images/btn_amigos.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        )),
        _image(context),
      ]),
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
