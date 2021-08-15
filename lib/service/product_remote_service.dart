import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductRemoveService {

  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {

    var response =
      await client.get(
        Uri.parse(
          "https://javathree99.com/s271059/getx_little_cake_story/load_product.php")
      );
      if (response.statusCode == 200) {
      if (response.body == "nodata") {
        return null;
      } else {
        var jsonString = response.body;
        print("IN remoteservices" + jsonString);
        return productFromJson(jsonString);
      }
    } else {
      //show error message
      // return null;
      throw Exception('Failed to load Categories from API');
    }
  }
}