import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:flutter_getx_littlecakestory/service/product_remote_service.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  static SearchController get to => Get.find<SearchController>();

  var isSearching = false.obs;
  late TextEditingController searchProductController = new TextEditingController();
  var productList = <Product>[].obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadSearchPage();
    super.onInit();
  }

  void loadSearchPage() {

    try {
      isLoading(true);
      if (productList.isEmpty) {
        statusMsj("Search_Product".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchProduct() async {

    // searchProductController.text = "Bake";

    try {
      isLoading(true);
      var products = await ProductRemoveService.searchProduct(searchProductController.text.toString());
      if (products != null) {
        productList.assignAll(products);
        searchResult.value = true;
      } else {
        // productList = null;
        searchResult.value = false;
        statusMsj("Not_Found".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void checkTextField(){

    searchProductController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchProductController.clear();
    isSearching.value = false;
    productList.clear();
    statusMsj("Search_Product".tr);
  }
  
}