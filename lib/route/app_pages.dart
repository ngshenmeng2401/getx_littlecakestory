import 'package:flutter_getx_littlecakestory/pages/login/binding/login_biding.dart';
import 'package:flutter_getx_littlecakestory/pages/login/view/login_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/not_found_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/signup/binding/signup.dart';
import 'package:flutter_getx_littlecakestory/pages/signup/view/signup_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/splash/binding/splash_binding.dart';
import 'package:flutter_getx_littlecakestory/pages/splash/view/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages{

  static final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.Login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.Signup,
      page: () => SignUpScreen(),
      binding:SignUpBinding(),
    ),
    
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundScreen(),
  );
}