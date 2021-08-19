import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageSettingController extends GetxController{
  
  final List<String> language = ["English","华语"];
  var selectLanguage ;
  final appData = GetStorage();
  // late var locale = Locale('en', 'US');
  late Locale locale;

  @override
  void onInit() {
    loadLanguage();
    super.onInit();
  }

  void clickLanguage(value ,locale){

    selectLanguage = value;
    Get.updateLocale(locale);
    print(selectLanguage);
    print(locale.toString());
    storeLanguage(value);
    update();
  }

  void storeLanguage(value){

    appData.write('language', value);

  }

  void loadLanguage(){

    selectLanguage = (appData.read('language') ?? '');
    print(selectLanguage);
  }
}