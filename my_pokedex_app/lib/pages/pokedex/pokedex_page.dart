import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:get/get.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'pokedex_controller.dart';
import 'package:my_pokedex_app/components/pokedex_entry.dart';

class PokedexPage extends StatefulWidget {
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
      control.filterPokemons = control.pokemons
          .where(
              (pokemon) => pokemon.nombre.toLowerCase().contains(filterPokemon))
          .toList();
    });
  }

  @override
  void dispose() {
    control.filterController.dispose();
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
          MyTextField('Filtrar', true, control.filterController),
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
                    return PokedexEntry(
                      number: '#${pokemon.numero}',
                      name: pokemon.nombre,
                      types: pokemon.tipos,
                      imageUrl: pokemon.imagenUrl,
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
