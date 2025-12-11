
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favIds = {};

  List<String> get favIds => _favIds.toList();

  bool isFavorite(String id) => _favIds.contains(id);

  void toggleFavorite(String id) {
    if (_favIds.contains(id)) {
      _favIds.remove(id);
    } else {
      _favIds.add(id);
    }
    notifyListeners();
  }
}