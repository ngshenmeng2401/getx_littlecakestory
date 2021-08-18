import 'dart:convert';
import 'package:get/get.dart';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
    Cart({
        this.productNo,
        this.productName,
        required this.productPrice,
        this.rating,
        required this.productQty,
        this.productSize,
        this.eggless,
        required this.totalPrice,
    });

    String? productNo;
    String? productName;
    String productPrice;
    String? rating;
    String productQty;
    String?productSize;
    String? eggless;
    String totalPrice;

    var qty = 0.obs;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productNo: json["product_no"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        rating: json["rating"],
        productQty: json["product_qty"],
        productSize: json["product_size"],
        eggless: json["eggless"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "product_no": productNo,
        "product_name": productName,
        "product_price": productPrice,
        "rating": rating,
        "product_qty": productQty,
        "product_size": productSize,
        "eggless": eggless,
        "total_price": totalPrice,
    };
}
