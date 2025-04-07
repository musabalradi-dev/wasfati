import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasfati/feature/authentication/screens/on_boarding/on_boarding.dart';
import 'package:wasfati/feature/personalization/controllers/settings/settings.dart';
import 'package:wasfati/localization/languages.dart';
import 'package:wasfati/navigation_menu.dart';
import 'package:wasfati/utils/theme/theme.dart';

class MyApp extends StatelessWidget {

  final isStarted = GetStorage().read('onBoarding') ?? true;

  MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: settingsController.theme,
      theme: MyThemeApp.lightTheme,
      darkTheme: MyThemeApp.darkTheme,
      home: isStarted ? OnBoardingScreen() : NavigationMenu(),
      translations: Languages(),
      locale: settingsController.getLocale(),
      fallbackLocale: Locale('en', 'US'),
      transitionDuration: Duration(milliseconds: 500),
      defaultTransition: Transition.cupertino,
    );
  }
}
