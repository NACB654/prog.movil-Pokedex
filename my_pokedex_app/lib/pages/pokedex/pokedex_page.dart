import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'pokedex_controller.dart';
import 'package:my_pokedex_app/components/pokedex_entry.dart';

class PokedexPage extends StatefulWidget {
  final User userInfo;

  PokedexPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  Color backColor = const Color(0xFFF4F2F2);
  PokedexController control = Get.put(PokedexController());

  @override
  void initState() {
    control.filterPokemons = control.pokemons;
    control.filterController.addListener(filterByName);
    super.initState();
  }

  void filterByName() {
    setState(() {
      String filterPokemon = control.filterController.text;
      control.filterPokemons = RxList.from(control.pokemons
          .where(
              (pokemon) => pokemon.name.toLowerCase().contains(filterPokemon)));
    });
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

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
          MyTextField('Filtrar', true, control.filterController, false),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              if (control.pokemons.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: control.filterPokemons.length,
                  itemBuilder: (context, index) {
                    Pokemon pokemon = control.filterPokemons[index];
                    return GestureDetector(
                      onTap: () {
                        control.goToDetail(context, pokemon);
                      },
                      child: PokedexEntry(
                        name: pokemon.name,
                        number: "${pokemon.index}",
                        imageUrl: pokemon.sprite_url,
                        types: pokemon.tipos,
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    control.getPokemons(widget.userInfo.id);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: MyAppBar(backColor),
      ),
      body: _buildBody(context),
    );
  }
}
