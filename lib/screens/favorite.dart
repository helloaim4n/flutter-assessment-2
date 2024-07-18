import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current AppState instance
    var appState = context.watch<AppState>();

    // Show a message if there are no favorites
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet 🤔'),
      );
    }

    // Display the list of favorites
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ❤️${appState.favorites.length} favorites'),
        ),
        // Iterate through the list of favorites and create a ListTile for each
        for (var post in appState.favorites)
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(post.title), // Assuming Post has a 'title' property
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                appState.removeFavorite(post);
              },
            ),
          ),
      ],
    );
  }
}
