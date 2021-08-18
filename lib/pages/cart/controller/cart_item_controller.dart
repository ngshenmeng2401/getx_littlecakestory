import 'package:flutter_getx_littlecakestory/pages/cart/model/cart.dart';
import 'package:flutter_getx_littlecakestory/service/product_remote_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartItemController extends GetxController{
  
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
}