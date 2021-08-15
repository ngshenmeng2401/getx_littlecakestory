import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_littlecakestory/pages/account/view/account_page.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/view/cart_page.dart';
import 'package:flutter_getx_littlecakestory/pages/home/view/home_page.dart';
import 'package:flutter_getx_littlecakestory/pages/search/view/search_page.dart';
import 'package:flutter_getx_littlecakestory/widget/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (controller){
        return Scaffold(

          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                SearchPage(),
                CartPage(),
                AccountPage(),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.search,
                label: 'Search',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.cart,
                label: 'Cart',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
