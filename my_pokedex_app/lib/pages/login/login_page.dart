import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color backColor = const Color(0xFFF4F2F2);
  bool isKeyboardOpen = false;
  LoginController control = Get.put(LoginController());

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
          SizedBox(width: 300, child: MyTextField("Usuario", false, control.emailController)),
          const SizedBox(height: 20),
          SizedBox(width: 300, child: MyTextField("Password", false, control.passwordController)),
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
          _mybutton(context, "Ingresar")
          
        ],
      ),
    );
  }

  Widget _links(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            control.goToSignIn(context);
          },
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
          onTap: () => _dialogBuilder(context),
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
                  MyTextField("Correo electronico", false, control.emailController),
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

  Widget _mybutton(BuildContext context, String label) {
    return SizedBox(
      width: 200,
      child: TextButton(
        onPressed: () => {control.loginAccount(context)},
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
