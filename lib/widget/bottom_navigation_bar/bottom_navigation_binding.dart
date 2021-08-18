import 'package:flutter_getx_littlecakestory/pages/account/controller/account_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/home/controller/home_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/search/controller/search_controller.dart';
import 'package:flutter_getx_littlecakestory/widget/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(() => BottomNavigationBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<SearchController>(() => SearchController());
  }
}