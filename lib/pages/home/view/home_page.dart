import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/controller/cart_item_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/home/controller/home_controller.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'product_tile.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final cartController = Get.put(CartItemController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("LITTLE CAKE STORY"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 5, 0),
            child: Container(
              width: 30,
              height: 10,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.CartPage);
                },
                child: Stack(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 28,
                      color: Colors.white,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              color: Colors.red[300],
                              shape: BoxShape.circle),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 1,
                                left: 4,
                                child: GetX<CartItemController>(
                                  builder: (controller) {
                                    return Text(
                                      controller.totalQty.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ),
                            ]
                          ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              homeController.categoryDialog();
            }, 
            icon: Icon(Icons.list))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (homeController.isLoading.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.red[200],
                      ),
                      SizedBox(height: 10),
                      Text(
                        homeController.statusMsj.toString().tr,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              } else if (homeController.productList.isEmpty) {
                return Center(
                  child: Text(
                  homeController.statusMsj.toString(),
                  style: TextStyle(fontSize: 20),
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: homeController.productList.length,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return ProductTile(homeController.productList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
