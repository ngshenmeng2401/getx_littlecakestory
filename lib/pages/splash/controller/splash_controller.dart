import 'dart:async';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {

    Timer(Duration(seconds: 3), () => Get.offAndToNamed(AppRoutes.Login)
    
    );
  }
}