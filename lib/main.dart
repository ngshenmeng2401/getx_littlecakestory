import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 
void main() async {

  await GetStorage.init();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Little Cake Story',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
    );
  }
}

