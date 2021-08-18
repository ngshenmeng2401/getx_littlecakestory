import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:flutter_getx_littlecakestory/theme/dark_theme.dart';
import 'package:flutter_getx_littlecakestory/theme/light_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'language/translation_service.dart';

final appData = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    return GetMaterialApp(
      title: 'Little Cake Story',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      theme: isDarkMode ? CustomDarkTheme.darktheme : CustomLightTheme.lighttheme,
      // darkTheme: CustomDarkTheme.darktheme,
      themeMode: ThemeMode.system,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}

