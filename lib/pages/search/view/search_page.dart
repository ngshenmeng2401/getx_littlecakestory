import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/controller/cart_item_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/home/view/product_tile.dart';
import 'package:flutter_getx_littlecakestory/pages/search/controller/search_controller.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final searchController = Get.put(SearchController());
  final cartController = Get.put(CartItemController());

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
                          child: Stack(children: <Widget>[
                            Positioned(
                              top: 1,
                              left: 4,
                              child: GetX<CartItemController>(
                                builder: (controller) {
                                  return Text(
                                    controller.totalQty.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  );
                                },
                              ),
                            ),
                          ]),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: searchController.searchProductController,
                        onChanged: (value) {
                          searchController.checkTextField();
                        },
                        decoration: InputDecoration(
                          hintText: "Enter_Product_Name".tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => IconButton(
                        onPressed: () {
                          searchController.clearTextField();
                        },
                        icon: searchController.isSearching.value == true
                            ? Icon(Icons.clear)
                            : Icon(
                                Icons.clear,
                                color: Colors.transparent,),
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          searchController.searchProduct();
                        }, 
                        icon: Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight/1.42,
                child: Obx(() {
                  if (searchController.isLoading.value) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red[200],
                          ),
                          SizedBox(height: 10),
                          Text(
                            searchController.statusMsj.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  } else if (searchController.productList.isEmpty) {
                    return Center(
                        child: Text(
                      searchController.statusMsj.toString(),
                      style: TextStyle(fontSize: 20),
                    ));
                  } 
                  else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: StaggeredGridView.countBuilder(
                          crossAxisCount: 2,
                          itemCount: searchController.productList.length,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          itemBuilder: (context, index) {
                            return ProductTile(searchController.productList[index]);
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
                    );
                  }
                }),
              )
            ],
      ))),
    );
  }
}
