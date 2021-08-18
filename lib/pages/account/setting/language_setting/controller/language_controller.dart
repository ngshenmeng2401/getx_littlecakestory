import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageSettingController extends GetxController{
  
  final List<String> language = ["English","华语"];
  var selectLanguage ;
  final appData = GetStorage();
  late Locale locale;

  void clickLanguage(value ,locale){

    selectLanguage = value;
    Get.updateLocale(locale);
    print(selectLanguage);
    print(locale.toString());
    update();
  }

  void storeLanguage(){

  }
}