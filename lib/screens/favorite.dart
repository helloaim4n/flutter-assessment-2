import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/post_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    // Display the list of favorites
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: appState.favorites.isEmpty
          ? const Center(
              child: Text('No favorites yet'),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: appState.favorites
                  .map((post) => PostCard(post: post))
                  .toList(),
            ),
    );
  }
}
