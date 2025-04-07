import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  final deviceStorage = GetStorage();
  final isDarkMode = false.obs;

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => deviceStorage.read('isDarkMode') ?? false;

  void saveTheme(isDarkMode) => deviceStorage.write('isDarkMode', isDarkMode);

  void changeTheme(value) {
    isDarkMode.value = value;
    Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!_loadTheme());
  }

  // Get the saved language from storage or return default (English)
  String get language => deviceStorage.read('language') ?? 'en';

  // Save language to storage
  Future<void> saveLanguage(String languageCode) async {
    await deviceStorage.write('language', languageCode);
  }

  // Get the current locale
  Locale getLocale() {
    return language == 'ar' ? const Locale('ar') : const Locale('en');
  }

  // Change app language
  void changeLanguage(String languageCode) {
    saveLanguage(languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  @override
  void onInit() {
    isDarkMode.value = deviceStorage.read('isDarkMode') ?? false;
    super.onInit();
  }
}