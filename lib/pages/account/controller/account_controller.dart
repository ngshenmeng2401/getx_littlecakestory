import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController{

  final appData = GetStorage(); 
  late bool selectDarkMode ;
  late String email = appData.read("email");

  @override
  void onInit() {
    super.onInit();
  }

  void logoutUser(){

    appData.write('isLogged', false);
    appData.remove('keepLogin');
    Get.offNamedUntil(AppRoutes.Login, (route) => false);
  }
}