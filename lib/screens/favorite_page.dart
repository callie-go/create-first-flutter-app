import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/my_app_state.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text("Favorite is empty"),
      );
    } else {
      return ListView.builder(
          itemCount: appState.favorites.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(appState.favorites[index].asLowerCase),
                leading: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    appState.favorites.remove(appState.favorites[index]);
                    setState(() {});
                  },
                ));
          });
    }
  }
}
