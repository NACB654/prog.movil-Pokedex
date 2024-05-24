import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:get/get.dart';
import 'pokedex_controller.dart';
import 'package:my_pokedex_app/components/pokedex_entry.dart';


class PokedexPage extends StatefulWidget {
  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  Color backColor = const Color(0xFFF4F2F2);
  PokedexController control = Get.put(PokedexController());

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
          Expanded(
            child: Obx(() {
              if (control.pokemons.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: control.pokemons.length,
                  itemBuilder: (context, index) {
                    var pokemon = control.pokemons[index];
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
