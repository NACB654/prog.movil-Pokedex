import 'package:flutter/material.dart';
import 'package:my_pokedex_app/pages/login/login_page.dart';
import 'package:my_pokedex_app/pages/config/config_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Login", home: SettingsScreen());
  }
}
