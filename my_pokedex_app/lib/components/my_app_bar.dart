import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  Color backColor = const Color(0xFFFFFFFF);

  MyAppBar(this.backColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/topimage.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
              colors: [backColor.withOpacity(0.5), backColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
      ),
      scrolledUnderElevation: 0,
    );
  }
}
