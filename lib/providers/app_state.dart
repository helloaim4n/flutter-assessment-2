import 'package:flutter/material.dart';
import '../models/post.dart';

class AppState extends ChangeNotifier {
  final List<Post> _favorites = [];

  List<Post> get favorites => _favorites;

  void toggleFavorite(Post post) {
    if (_favorites.contains(post)) {
      _favorites.remove(post);
    } else {
      _favorites.add(post);
    }
    notifyListeners();
  }

  void removeFavorite(Post post) {
    if (_favorites.contains(post)) {
      _favorites.remove(post);
      notifyListeners();
    }
  }
}
