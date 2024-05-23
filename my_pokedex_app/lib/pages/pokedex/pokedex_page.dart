import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/pages/pokedex/pokedex_controller.dart';

class PokedexPage extends StatefulWidget {
  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  Color backColor = const Color(0xFFF4F2F2);
  bool isKeyboardOpen = false;
  PokedexController control = Get.put(PokedexController());

  // @override
  // void initState() {
  //   super.initState();

  //   KeyboardVisibilityController().onChange.listen((bool visible) {
  //     setState(() {
  //       isKeyboardOpen = visible;
  //     });
  //   });
  // }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: backColor,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 30),
          MyTextField('Filtrar', true, control.filterController),
        ],
      )
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
