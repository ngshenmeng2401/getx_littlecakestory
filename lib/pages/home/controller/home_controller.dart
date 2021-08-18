import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:flutter_getx_littlecakestory/service/product_remote_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  final appData = GetStorage();
  late String? email = appData.read("keepLogin");
  List<String> category = [
    "Default",
    "BentoCake",
    "Cake",
    "CupCake",
    "Puff",
    "Tart"
  ];
  var selectCategory = "Default";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductRemoveService.fetchProducts(selectCategory);
      if (products != null) {
        productList.assignAll(products);
      } else {
        // productList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void addToFavourite(bool isSelected, String? productNo) {
    isSelected == true
        ? ProductRemoveService.addFavorite(productNo, email)
        : ProductRemoveService.removeFavorite(productNo, email);
    print(productNo);
    print(isSelected);
  }

  void addToCart(String? price, String? productNo) {
    ProductRemoveService.addCartItem(price, productNo, email);
  }

  void loginMessage() {
    Get.bottomSheet(
      Container(
        height: 75,
        color: Get.theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Please_Login_An_Account".tr,
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    height: 25,
                    color: Colors.red[200],
                    onPressed: () {
                      Get.offNamedUntil(AppRoutes.Login, (route) => false);
                    },
                    child: Text("Login".tr),
                  ),
                  MaterialButton(
                    height: 25,
                    color: Colors.red[200],
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel".tr),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clickCategories(value) {
    selectCategory = value;
    print(selectCategory);
    update();
  }

  void submitCategories() {

    fetchProducts();
    Get.back();
  }

  void categoryDialog() {
    Get.defaultDialog(
        title: "Categories".tr,
        content: Column(
          children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return ListTile(
                  title: Text("Default".tr),
                  trailing: Radio(
                      activeColor: Colors.red[200],
                      value: category[0],
                      groupValue: selectCategory,
                      onChanged: (value) {
                        clickCategories(value);
                      }),
                );
              },
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return ListTile(
                  title: Text("Bento_Cake".tr),
                  trailing: Radio(
                      activeColor: Colors.red[200],
                      value: category[1],
                      groupValue: selectCategory,
                      onChanged: (value) {
                        clickCategories(value);
                      }),
                );
              },
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return ListTile(
                  title: Text("Cake".tr),
                  trailing: Radio(
                      activeColor: Colors.red[200],
                      value: category[2],
                      groupValue: selectCategory,
                      onChanged: (value) {
                        clickCategories(value);
                      }),
                );
              },
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return ListTile(
                  title: Text("Cup_Cake".tr),
                  trailing: Radio(
                      activeColor: Colors.red[200],
                      value: category[3],
                      groupValue: selectCategory,
                      onChanged: (value) {
                        clickCategories(value);
                      }),
                );
              },
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return ListTile(
                  title: Text("Puff".tr),
                  trailing: Radio(
                      activeColor: Colors.red[200],
                      value: category[4],
                      groupValue: selectCategory,
                      onChanged: (value) {
                        clickCategories(value);
                      }),
                );
              },
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return ListTile(
                  title: Text("Tart".tr),
                  trailing: Radio(
                      activeColor: Colors.red[200],
                      value: category[5],
                      groupValue: selectCategory,
                      onChanged: (value) {
                        clickCategories(value);
                      }),
                );
              },
            ),
          ],
        ),
      confirmTextColor: Colors.white,
      textConfirm: "Select".tr,
      onConfirm: () =>submitCategories(),
      textCancel: "Cancel".tr,
      onCancel: () => Get.back(),
      buttonColor: Colors.red[200],
    );
  }
}
