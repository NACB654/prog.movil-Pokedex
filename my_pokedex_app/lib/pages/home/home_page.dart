import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/home/home_controller.dart';
import 'package:my_pokedex_app/pages/result/result_page.dart';

class HomePage extends StatelessWidget {
  final Color backColor = const Color(0xFFF4F2F2);
  final HomeController control = HomeController();
  final User userInfo;

  HomePage({Key? key, required this.userInfo}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return Container(
      color: backColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            child: Text(
              'Hola ${userInfo.nickname}', // CAMBIE DE USER A NICKNAME (user -> nickname)
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto'),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Line 1.png"),
                  fit: BoxFit.contain),
            ),
            height: 10,
            child: null,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    control.goToPokedex(context, userInfo);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/btn_pokedex.png"),
                          fit: BoxFit.contain),
                    ),
                    height: 180,
                  ),
                ),
                // const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Pokemon? newPokemon =
                            await control.goToEscanear(context, userInfo.id);
                        if (newPokemon != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ResultPage(
                                        pokemonInfo: newPokemon,
                                        userInfo: userInfo,
                                      ))));
                        } else {
                          _showSnackbar(context);
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/btn_escanear.png"),
                              fit: BoxFit.contain),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: 165,
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            control.goToFriends(context, userInfo);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/btn_amigos.png"),
                                  fit: BoxFit.contain),
                            ),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: 170,
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            control.goToConfig(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/btn_config.png"),
                                  fit: BoxFit.contain),
                            ),
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pokeball.png"),
                  fit: BoxFit.contain),
            ),
            height: 80,
          ),
        ],
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    const snackbar = SnackBar(
      content:
          Text('Error al identificar Pokemon. Vuelve a intentarlo más tarde'),
      duration: Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
