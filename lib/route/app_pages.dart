import 'package:flutter_getx_littlecakestory/pages/account/binding/account_binding.dart';
import 'package:flutter_getx_littlecakestory/pages/account/setting/language_setting/view/language_setting_page.dart';
import 'package:flutter_getx_littlecakestory/pages/account/setting/theme_setting/view/theme_setting.dart';
import 'package:flutter_getx_littlecakestory/pages/account/setting/view/setting_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/account/view/account_page.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/view/cart_page.dart';
import 'package:flutter_getx_littlecakestory/pages/home/view/home_page.dart';
import 'package:flutter_getx_littlecakestory/pages/login/binding/login_biding.dart';
import 'package:flutter_getx_littlecakestory/pages/login/view/login_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/not_found_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/search/view/search_page.dart';
import 'package:flutter_getx_littlecakestory/pages/signup/binding/signup.dart';
import 'package:flutter_getx_littlecakestory/pages/signup/view/signup_screen.dart';
import 'package:flutter_getx_littlecakestory/pages/splash/binding/splash_binding.dart';
import 'package:flutter_getx_littlecakestory/pages/splash/view/splash_screen.dart';
import 'package:flutter_getx_littlecakestory/widget/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter_getx_littlecakestory/widget/bottom_navigation_bar/bottom_navigation_binding.dart';
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

    GetPage(
      name: AppRoutes.BottomNavigation,
      page: () => BottomNavigationBarWidget(),
      binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.HomePage,
      page: () => HomePage(),
      // binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: AppRoutes.SearchPage,
      page: () => SearchPage(),
      // binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: AppRoutes.CartPage,
      page: () => CartPage(),
      // binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: AppRoutes.AccountPage,
      page: () => AccountPage(),
      binding: AccountBinding(),
    ),

    GetPage(
      name: AppRoutes.SettingsPage,
      page: () => SettingPage(),
    ),

    GetPage(
      name: AppRoutes.LanguagePage,
      page: () => LanguageSettingPage(),
    ),

    GetPage(
      name: AppRoutes.ThemePage,
      page: () => ThemeSettingPage(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundScreen(),
  );
}