import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/type_badge.dart';
import 'package:my_pokedex_app/models/entities/pokemon.dart';
import 'package:my_pokedex_app/pages/detail/detail_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final Pokemon pokemonInfo;

  DetailPage({Key? key, required this.pokemonInfo}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
  Map<int, String> regions = {
    1: "Kanto",
    2: "Johto",
    3: "Hoenn",
    4: "Sinnoh",
    5: "Unova",
    6: "Kalos"
  };

  DetailController control = DetailController();
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
    _playAudio();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(UrlSource(widget.pokemonInfo.audio_url));
  }

  Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          colors[widget.pokemonInfo.tipos[0].name]!.withOpacity(0.5),
          colors[widget.pokemonInfo.tipos[0].name]!
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
                    widget.pokemonInfo.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.pokemonInfo.index < 10
                        ? '# 00${widget.pokemonInfo.index}'
                        : widget.pokemonInfo.index < 100
                            ? '# 0${widget.pokemonInfo.index}'
                            : '# ${widget.pokemonInfo.index}',
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
                children: widget.pokemonInfo.tipos
                    .map((tipo) => TypeBadge(tipo))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            Image.network(widget.pokemonInfo.imagen_url,
                height: 200, width: 200),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
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
                              _tabArea(context),
                              _tabStats(context),
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pokemonInfo.description
                .replaceAll("\n", " ")
                .replaceAll("\f", " "),
            style: const TextStyle(fontSize: 15),
          ),
          const Spacer(flex: 1),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Height: ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "${widget.pokemonInfo.height}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Weight: ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "${widget.pokemonInfo.weight}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Abilities: ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "${widget.pokemonInfo.habilidades.map((e) => e.name).toList().join(", ")}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabArea(BuildContext context) {
    return widget.pokemonInfo.rutas.isNotEmpty
        ? Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Region: ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${regions[widget.pokemonInfo.rutas[0].region_id]}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Locations: ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${widget.pokemonInfo.rutas.map((e) => e.name).toList().join(", ")}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: const Text(
              "Area unknown",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ));
  }

  Widget _tabStats(BuildContext context) {
    final stats = {
      "Attack": widget.pokemonInfo.attack,
      "Defense": widget.pokemonInfo.defense,
      "Sp Attack": widget.pokemonInfo.sp_attack,
      "Sp Defense": widget.pokemonInfo.sp_defense,
      "Speed": widget.pokemonInfo.speed
    };

    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              dataEntries: stats.values
                  .map((e) => RadarEntry(value: e.toDouble()))
                  .toList(),
              borderColor: Colors.blue,
              fillColor: Colors.blue.withOpacity(0.5),
            ),
          ],
          radarShape: RadarShape.polygon,
          radarBackgroundColor: Colors.transparent,
          borderData: FlBorderData(show: false),
          titlePositionPercentageOffset: 0.2,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          getTitle: (index, angle) {
            return RadarChartTitle(
                text:
                    "${stats.keys.elementAt(index)}: ${stats.values.elementAt(index)}",
                angle: 0);
          },
          tickCount: 5,
          ticksTextStyle: const TextStyle(color: Colors.grey, fontSize: 10),
          gridBorderData: const BorderSide(color: Colors.grey, width: 2),
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
        child: MyAppBar(colors[widget.pokemonInfo.tipos[0].name]!),
      ),
      body: _buildBody(context),
    ));
  }
}
