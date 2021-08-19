import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'english.dart';
import 'mandarin.dart';

class TranslationService extends Translations {

  static final fallbackLocale = Locale('zh', 'Hans');
  static final appData = GetStorage();
  static final String selectLanguage = (appData.read("language") ?? '');
  static String language1 ='en' , language2 = 'US' ;
  
  static Locale checkLanguage(){

    if(selectLanguage=="华语"){

      language1 = 'zh';
      language2 = 'Hans';

    }else if (selectLanguage=="English"){

      language1 = 'en';
      language2 = 'US';
    }
    
    return Locale(language1, language2);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    
        'zh_Hans': zh_Hans,
        'en_US': en_US,
  };
}
