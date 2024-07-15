import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:my_pokedex_app/pages/about-us/aboutus_page.dart';
import 'package:my_pokedex_app/pages/config/config_controller.dart';
import 'package:my_pokedex_app/pages/login/login_page.dart';

class ConfigPage extends StatelessWidget {
  Color backColor = const Color(0xFFF4F2F2);
  ConfigController control = ConfigController();

  Widget _buildBody(BuildContext context) {
    return Container(
      color: backColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 50),
          _image(context),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _dialogBuilder(context),
                  child: const Text(
                    "Cambiar contraseña",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutPage()));
                  },
                  child: const Text(
                    "Acerca de",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => _cerrarSesion(context),
                  child: const Text(
                    "Cerrar sesión",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _image(context),
          const SizedBox(height: 30),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/qr.png"),
                  fit: BoxFit.fitHeight),
            ),
            height: 270,
          ),
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Line 1.png"), fit: BoxFit.contain),
      ),
      height: 10,
      child: null,
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Ingresa la dirección email con el cual tienes tu cuenta registrada para enviar un correo y cambiar su contraseña",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  MyTextField(
                      "Correo electronico", false, control.emailController, false),
                  const SizedBox(height: 15),
                  //Boton
                  SizedBox(
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
                        'Enviar',
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _dialogBuilder2(context);
                      },
                    ),
                  ),
                  //Boton
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Se a enviado a tu correo la solicitud de cambio de contraseña",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child:
                  //Boton
                  SizedBox(
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
                    'Regresar',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              //Boton
            ),
          ],
        );
      },
    );
  }

  Future<void> _cerrarSesion(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "¿Estas seguro que quieres cerrar sesión?",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          backgroundColor: backColor,
          actions: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    //Boton
                    SizedBox(
                      width: 80,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          backgroundColor: backColor,
                          side: const BorderSide(color: Color(0xFFD2232A)),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Si',
                          style:
                              TextStyle(color: Color(0xFFD2232A), fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      ),
                    ),
                    //Boton
                    SizedBox(
                      width: 80,
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
                          'No',
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    //Boton
                  ],
                )),
          ],
        );
      },
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
