import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/theme/dark_theme.dart';
import 'package:flutter_getx_littlecakestory/theme/light_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeSettingController extends GetxController{

  late ThemeData themeData;
  final appData = GetStorage();
  late bool isDarkMode;
  var selectTheme;

  @override
  void onInit() {
    loadTheme();
    super.onInit();
  }

  void chooseLightTheme(value) {

    isDarkMode = value;
    Get.changeTheme(isDarkMode ? CustomDarkTheme.darktheme : CustomLightTheme.lighttheme);
    storeRadioButton(value);
    print(isDarkMode);
    update();
  }


  void storeRadioButton(value) {

    appData.write('isDarkMode', isDarkMode);
    // print(value);
  }

  void loadTheme(){

    isDarkMode = appData.read('isDarkMode') ?? false; // null check for first time running this
    print(isDarkMode);
  }
}