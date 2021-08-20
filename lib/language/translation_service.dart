import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'english.dart';
import 'mandarin_simplified.dart';
import 'mandarin_traditional.dart';

class TranslationService extends Translations {

  static final fallbackLocale = Locale('en', 'US');
  static final appData = GetStorage();

  @override
  Map<String, Map<String, String>> get keys => {
    
        'zh_Hans': zh_Hans,
        'en_US': en_US,
        'zh_HK': zh_HK,
  };
}
