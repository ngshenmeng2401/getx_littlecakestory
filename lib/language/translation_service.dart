import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'english.dart';
import 'mandarin_simplified.dart';
import 'mandarin_traditional.dart';

class TranslationService extends Translations {

  static final fallbackLocale = Locale('zh', 'Hans');
  static final appData = GetStorage();
  static late String language1 ='' , language2 = '' ;
  static Locale locale = Locale('', '');
  
  static Locale checkLanguage(String selectLanguage){

    if(selectLanguage=="华语"){

      locale = Locale('zh', 'Hans');
      language1 = 'zh';
      language2 = 'Hans';

    }else if (selectLanguage=="English"){

      locale = Locale('en', 'US');
      language1 = 'en';
      language2 = 'US';
    }else if (selectLanguage=="華語繁體"){

      locale = Locale('zh', 'HK');
      language1 = 'zh';
      language2 = 'HK';
    }
    
    return locale;
  }

  @override
  Map<String, Map<String, String>> get keys => {
    
        'zh_Hans': zh_Hans,
        'en_US': en_US,
        'zh_HK': zh_HK,
  };
}
