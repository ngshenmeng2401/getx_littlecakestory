import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/controller/cart_item_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/model/cart.dart';
import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProductRemoveService {

  static var client = http.Client();
  static final appData = GetStorage();
  static final cartItemController = Get.put(CartItemController());

  static Future<List<Product>?> fetchProducts(String type) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/getx_little_cake_story/load_product.php"),
      body: {
        "type":type,

      });
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

  static Future<String?> removeFavorite(String? productNo, String? email) async{

    print("Removed from Favourite List");

    var response = await client
    .post(Uri.parse("https://javathree99.com/s271059/getx_little_cake_story/remove_favourite.php"), 
    body: {
      "product_no":productNo,
      "email":email,

    });
    if (response.statusCode == 200) {
       var resp = response.body;
      return resp;
    } else {
      //show error message
      return null;
    }    
  }

  static Future<String?> addFavorite(String? productNo, String? email) async{

    print("Add into Favourite List");

    var response = await client
    .post(Uri.parse("https://javathree99.com/s271059/getx_little_cake_story/add_favourite.php"), 
    body: {
      "product_no":productNo,
      "email":email,

    });
    if (response.statusCode == 200) {
       var resp = response.body;
      return resp;
    } else {
      //show error message
      return null;
    }    
  }

  static Future<List<Product>?> fetchFavouriteProducts() async {

    String? email = appData.read("keepLogin");

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/getx_little_cake_story/load_favourite.php"),
        body: {
        "email":email,
      });
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

  static Future<String?> removeCartItem(String? price,String? productNo, String? email) async{

    print("Removed from Cart List");

    var response = await client
    .post(Uri.parse("https://javathree99.com/s271059/getx_little_cake_story/delete_cart.php"), 
    body: {
      "price":price,
      "product_no":productNo,
      "email":email,
    });
    if (response.statusCode == 200) {
      var resp = response.body;
      cartItemController.fetchCarts();
      return resp;
    } else {
      //show error message
      return null;
    }    
  }

  static Future<String?> addCartItem(String? price,String? productNo, String? email) async{

    print("Add into Cart List");
    print(productNo);
    print(price);
    print(email);

    var response = await client
    .post(Uri.parse("https://javathree99.com/s271059/getx_little_cake_story/add_cart.php"), 
    body: {
      "price":price,
      "product_no":productNo,
      "email":email,

    });
    if (response.statusCode == 200) {

      var resp = response.body;
      cartItemController.fetchCarts();
      Fluttertoast.showToast(
        msg: "Add_to_Cart_Success".tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0);
      return resp;
    } else {
      //show error message
      return null;
    }    
  }

    static Future<String?> updateCartItem(String? price,String? productNo, String? email, String? qty) async{

    print(productNo);
    print(price);
    print(email);
    print(qty);

    var response = await client
    .post(Uri.parse("https://javathree99.com/s271059/getx_little_cake_story/update_cart.php"), 
    body: {
      "price":price,
      "product_no":productNo,
      "email":email,
      "quantity":qty ,
    });
    if (response.statusCode == 200) {
      var resp = response.body;
      cartItemController.fetchCarts();
      return resp;
    } else {
      //show error message
      return null;
    }    
  }

  static Future<List<Cart>?> fetchCartItem() async {

    String? email = appData.read("keepLogin");

    if (email != null) {
      var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/getx_little_cake_story/load_cart.php"),
        body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return cartFromJson(jsonString);
        }
      } else {
        //show error message
        return null;
      }
    }else{

      return null;
    }
  }

    static Future<List<Product>?> searchProduct(String productName) async {

    print(productName);

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/getx_little_cake_story/search_product.php"),
        body: {
        "name":productName,
      });
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
      return null;
    }
  }
}