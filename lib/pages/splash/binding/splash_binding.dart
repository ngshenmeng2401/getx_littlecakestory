import 'package:flutter_getx_littlecakestory/pages/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(),);
  }
}