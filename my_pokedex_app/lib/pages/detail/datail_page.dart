import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/type_badge.dart';
import 'package:my_pokedex_app/pages/detail/detail_controller.dart';

class DetailPage extends StatelessWidget {
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

  DetailController control = DetailController();

  Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          colors[control.prueba.tipos[0]]!.withOpacity(0.5),
          colors[control.prueba.tipos[0]]!
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    control.prueba.nombre,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '# 00${control.prueba.numero}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: control.prueba.tipos
                    .map((tipo) => TypeBadge(tipo))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            Image.network(control.prueba.imagenUrl, height: 200, width: 200),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 1.0,
                  widthFactor: 1.0,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        const TabBar(
                          tabs: [
                            Tab(text: "Info"),
                            Tab(text: "Area"),
                            Tab(text: "Stats"),
                          ],
                          labelColor: Color(0xFF6A696B),
                          indicator: UnderlineTabIndicator(
                              insets: EdgeInsets.symmetric(horizontal: 50),
                              borderSide: BorderSide(
                                  color: Color(0xFF1E8AEF), width: 2)),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _tabInfo(context),
                              Text("hola"),
                              Text("hola 2")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(control.prueba.descripcion),
          const SizedBox(height: 20),
          Text("Height: ${control.prueba.altura}"),
          Text("Weight: ${control.prueba.peso}"),
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
        child: MyAppBar(colors[control.prueba.tipos[0]]!),
      ),
      body: _buildBody(context),
    ));
  }
}
