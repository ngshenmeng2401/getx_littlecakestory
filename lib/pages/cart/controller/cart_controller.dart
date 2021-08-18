import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/model/cart.dart';
import 'package:flutter_getx_littlecakestory/service/product_remote_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController{

  var cartList = <Cart>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  final selected = "Cake".obs;
  final appData = GetStorage();

  int get totalQty =>
      cartList.fold(0, (sum, item) => sum + int.parse(item.productQty));

  double get totalPrice =>
      cartList.fold(0, (sum, item) => sum + double.parse(item.totalPrice));

  @override
  void onInit() {
    fetchCarts();
    super.onInit();
  }

  void fetchCarts() async {
    try {
      isLoading(true);
      var carts = await ProductRemoveService.fetchCartItem();
      if (carts != null) {
        cartList.assignAll(carts);
      } else {
        statusMsj("No data");
      }
    } finally {
      isLoading(false);
    }
  }

  void checkCalculationQty(String? op,String? price, String? productNo, int qty) {

    String? email = appData.read("keepLogin");

    if (op == "add") {
      qty++;
    }
    if (op == "remove") {
      qty--;
      if (qty == 0) {
        deleteCartDialog(price, productNo, email);
        return;
      }
    }
    updateCartQty(price, productNo, email, qty.toString());
    // print(qty);
  }

  Future<void> updateCartQty(String? price,String? productNo, String? email, String? qty) async {
    
    try {
      isLoading(true);
      var resp = await ProductRemoveService.updateCartItem(price, productNo, email, qty);
      if (resp == "success") {
        fetchCarts();
      }
      print(resp);
    } finally {
      isLoading(false);
    }
  }

  void deleteCartDialog(String? price, String? productNo, String? email){

    Get.defaultDialog(
      title: "Remove_this_item_from_cart".tr,
      content: Column(
        children: [
          Padding(padding: const EdgeInsets.all(0)),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        deleteCartItem(price, productNo, email);
      },
      // onCancel: () => Get.back(),
      cancelTextColor: Colors.red[200],
      confirmTextColor: Colors.white,
      buttonColor: Colors.red[200],
    );
  }

  Future<void> deleteCartItem(String? price, String? productNo, String? email) async {

    try {
      isLoading(true);
      var resp = await ProductRemoveService.removeCartItem(price, productNo, email);
      if (resp == "success") {
        fetchCarts();
      }
      print(resp);
    } finally {
      isLoading(false);
    }
  }
}