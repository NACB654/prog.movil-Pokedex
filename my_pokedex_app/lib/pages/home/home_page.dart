import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  Color backColor = const Color(0xFFF4F2F2);
  HomeController control = HomeController();

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
            child: const Text(
              'Hola usuario',
              style: TextStyle(
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
                    control.goToPokedex(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/btn_pokedex.png"),
                          fit: BoxFit.fitHeight),
                    ),
                    height: 190,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        control.goToEscanear(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/btn_escanear.png"),
                              fit: BoxFit.contain),
                        ),
                        height: 190,
                        width: 200,
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            control.goToFriends(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/btn_amigos.png"),
                                  fit: BoxFit.cover),
                            ),
                            height: 130,
                            width: 190,
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
                            width: 190,
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
