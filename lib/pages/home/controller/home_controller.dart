import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:flutter_getx_littlecakestory/service/product_remote_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  final selected = "Cake".obs;

  void setSelected(String value) {
    selected.value = value;
  }

  List<String> listType = [
    "Cup Cake",
    "Bento Cake",
    "Cake",
    "Puff",
    "Tart",
  ];

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductRemoveService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      } else {
        // productList = null;
        statusMsj("No data");
      }
    } finally {
      isLoading(false);
    }
  }
}