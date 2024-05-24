import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';

class FriendsPage extends StatelessWidget {
  Color backColor = const Color(0xFFF4F2F2);

  Widget _buildBody(BuildContext context) {
    return Container(
      color: backColor,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Text('Proximamente'),
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
