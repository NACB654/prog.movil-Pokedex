import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_buttons.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
// import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  Color backColor = const Color(0xFFF4F2F2);

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: backColor,
          ),
          _form(context)
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: MyAppBar(backColor),
      ),
      body: _buildBody(context),
    ));
  }
}
