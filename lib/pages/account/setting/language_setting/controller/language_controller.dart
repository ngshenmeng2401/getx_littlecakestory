import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageSettingController extends GetxController{
  
  final List<String> language = ["English","华语简体","華語繁體"];
  var selectLanguage = "English";
  var showLanguage;
  final appData = GetStorage();
  late String language1 ='' , language2 = '' ;
  late Locale locale = Locale('en', 'US');

  @override
  void onInit() {
    loadLanguage();
    super.onInit();
  }

  void clickLanguage(value){

    selectLanguage = value;
    print(selectLanguage);
    checkLanguage(value);
    update();
  }

  void checkLanguage(value){

    if(value=="华语简体"){

      locale = Locale('zh', 'Hans');
      language1 = 'zh';
      language2 = 'Hans';

    }else if (value=="English"){

      locale = Locale('en', 'US');
      language1 = 'en';
      language2 = 'US';
    }else if (value=="華語繁體"){

      locale = Locale('zh', 'HK');
      language1 = 'zh';
      language2 = 'HK';
    }
    Get.updateLocale(locale);
    storeLanguage(value,locale.toString());
  }

  void storeLanguage(value,locale){

    appData.write('language', value);
    appData.write('language2', locale);

  }

  void loadLanguage(){

    selectLanguage = (appData.read('language') ?? '');
    showLanguage = (appData.read('language2') ?? '');
    print(selectLanguage);
    print(showLanguage);
  }
}