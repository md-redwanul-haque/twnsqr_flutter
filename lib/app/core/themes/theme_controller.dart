import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_themes.dart';

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  ThemeData get currentTheme =>
      _isDarkMode.value ? AppThemes.dark : AppThemes.light;

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }
}
