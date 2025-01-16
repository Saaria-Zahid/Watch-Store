import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Reactive variable for theme mode
  var isDarkMode = false.obs;

  @override
  void onInit() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    isDarkMode.value = (brightness == Brightness.dark);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    super.onInit();
  }

  // Toggle between dark and light modes
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
