import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  Color backColor = const Color(0xFFFFFFFF);

  MyAppBar(this.backColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: const Image(
        image: AssetImage("assets/images/topimage.png"),
        fit: BoxFit.cover,
      ),
      backgroundColor: backColor,
      scrolledUnderElevation: 4.0,
    );
  }
}
