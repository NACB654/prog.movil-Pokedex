import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/friend_entry.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:my_pokedex_app/models/entities/friends.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/friends/friends.controller.dart';

class FriendsPage extends StatefulWidget {
  final User userInfo;

  FriendsPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  Color backColor = const Color(0xFFF4F2F2);
  FriendController control = FriendController();
  List<Friend> userFriends = [];

/* NO HAY AMIGOS DEFINIDOS EN USUARIO.PY EN EL BACK
  @override
  void initState() {
    userFriends = control.friends
        .where((friend) => widget.userInfo.amigos.contains(friend.username))
        .toList();
    control.filterFriend = userFriends;
    control.filterController.addListener(filterByName);
    super.initState();
  }
*/
  void filterByName() {
    setState(() {
      String filter = control.filterController.text;
      control.filterFriend = userFriends
          .where((friend) => friend.username.toLowerCase().contains(filter))
          .toList();
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
            child: control.friends.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: control.filterFriend.length,
                    itemBuilder: (context, index) {
                      Friend friend = control.filterFriend[index];
                      return FriendEntry(
                        name: friend.username,
                        pokemons: friend.pokemons,
                        imageUrl: friend.imagenUrl,
                      );
                    },
                  ),
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
