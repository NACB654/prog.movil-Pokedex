import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/detail/detail_page.dart';
import 'package:my_pokedex_app/pages/home/home_page.dart';

class ResultPage extends StatelessWidget {
  // final HomeController control = HomeController();
  final Pokemon pokemonInfo;
  final User userInfo;

  Map<String, Color> colors = {
    'GRASS': const Color(0xFF3FA129),
    'POISON': const Color(0xFF9141CB),
    'FIRE': const Color(0xFFE62829),
    'WATER': const Color(0xFF2980EF),
    'ELECTRIC': const Color(0xFFFAC000),
    'NORMAL': const Color(0xFF9FA19F),
    'FAIRY': const Color(0xFFEF70EF),
    'PSYCHIC': const Color(0xFFEF4179),
    'GHOST': const Color(0xFF704170),
    'FIGHTING': const Color(0xFFF27900),
    'STEEL': const Color(0xFF60A1B8),
    'ICE': const Color(0xFF3DCEF3),
    'ROCK': const Color(0xFFAFA981),
    'GROUND': const Color(0xFF915121),
    'FLYING': const Color(0xFF6FB4F6),
    'BUG': const Color(0xFF91A119),
    'DARK': const Color(0xFF624D4E),
    'DRAGON': const Color(0xFF5060E1)
  };

  ResultPage({Key? key, required this.pokemonInfo, required this.userInfo}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          colors[pokemonInfo.tipos[0].name]!.withOpacity(0.5),
          colors[pokemonInfo.tipos[0].name]!
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(pokemonInfo.imagen_url, height: 200, width: 200),
            const SizedBox(height: 25),
            Text(
              "${pokemonInfo.name} detectado",
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            _mybutton(context, "Registrar"),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Volver a escanear",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD2232A),
                ),
              ),
            ),
          ],
        )));
  }

  Widget _mybutton(BuildContext context, String label) {
    return SizedBox(
      width: 200,
      child: TextButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(userInfo: userInfo)))
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
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: MyAppBar(colors[pokemonInfo.tipos[0].name]!),
      ),
      body: _buildBody(context),
    ));
  }
}
