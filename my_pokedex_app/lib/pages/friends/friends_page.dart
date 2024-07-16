import 'package:flutter/material.dart';
import 'package:my_pokedex_app/components/friend_entry.dart';
import 'package:my_pokedex_app/components/my_app_bar.dart';
import 'package:my_pokedex_app/components/my_text_field.dart';
import 'package:my_pokedex_app/models/entities/friends.dart';
import 'package:my_pokedex_app/models/entities/user.dart';
import 'package:my_pokedex_app/pages/friends/friends_controller.dart';
import 'package:my_pokedex_app/pages/search_friend/search_friend_page.dart';

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
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchFriends();
  }

  void fetchFriends() async {
    try {
      await control.fetchFriends(widget.userInfo.id.toString());
      setState(() {
        userFriends = control.friends;
        control.filterFriend = control.friends;
      });
    } catch (e) {
      print('Failed to load friends: $e');
    }
  }

  void filterByName() {
    setState(() {
      String filter = control.filterController.text.toLowerCase();
      control.filterFriend = userFriends
          .where((friend) => friend.nickname.toLowerCase().contains(filter))
          .toList();
    });
  }

  Future<void> showAddFriendDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Ingresa el nombre del usuario',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(searchController.text);
                },
                child: Text('Buscar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      try {
        Friend resultFriend = await control.searchFriend(result);
        final addedFriend = await Navigator.push<Friend>(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultPage(friend: resultFriend, currentUserId: widget.userInfo.id.toString()),
          ),
        );

        if (addedFriend != null) {
          await control.addFriend(widget.userInfo.id.toString(), addedFriend.id.toString());
          setState(() {
            userFriends.add(addedFriend);
            control.filterFriend = userFriends;
          });
        }
      } catch (e) {
        print('Failed to search or add friend: $e');
      }
    }
  }

  Future<void> showDeleteSuccessDialog(BuildContext context, Friend friend) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Has eliminado a ${friend.nickname}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'REGRESAR',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}


  Future<void> showDeleteFriendDialog(BuildContext context, Friend friend) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '¿Estás seguro que quieres eliminar a ${friend.nickname}?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'NO',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await control.deleteFriend(widget.userInfo.id.toString(), friend.id.toString());
                    setState(() {
                      userFriends.remove(friend);
                      control.filterFriend = userFriends;
                    });
                    Navigator.of(context).pop();
                    showDeleteSuccessDialog(context, friend);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'SI',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}


  @override
  void dispose() {
    control.dispose();
    searchController.dispose();
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
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Image.asset('assets/images/add_friend.png'),
              iconSize: 40,
              onPressed: () {
                showAddFriendDialog(context);
              },
            ),
          ),
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
                        name: friend.nickname,
                        pokemons: 0,
                        imageUrl: friend.imagenUrl,
                        onLongPress: () {
                          showDeleteFriendDialog(context, friend);
                        },
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
