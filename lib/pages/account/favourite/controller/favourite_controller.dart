import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:flutter_getx_littlecakestory/service/product_remote_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController{

  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  final selected = "Cake".obs;
  final appData = GetStorage();

  @override
  void onInit() {
    fetchFavouriteProducts();
    
    super.onInit();
  }

  void fetchFavouriteProducts() async {
    try {
      isLoading(true);
      var products = await ProductRemoveService.fetchFavouriteProducts();
      if (products != null) {
        productList.assignAll(products);
      } else {
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  // void removeFavorite(productNo){

  //   String? email = appData.read("keepLogin");

  //   ProductRemoveService.removeFavorite(productNo,email);
  //   fetchFavouriteProducts();
  // }
}