import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDark = false;
  double _fontSize = 16.0;

  bool get isDark => _isDark;
  double get fontSize => _fontSize;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }
}
