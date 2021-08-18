import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        this.productNo,
        this.productName,
        this.originalPrice,
        this.offeredPrice,
        this.rating,
        this.productDetail,
        this.type,
    });

    String? productNo;
    String? productName;
    String? originalPrice;
    String? offeredPrice;
    String? rating;
    String? productDetail;
    String? type;

    var isFavorite = false.obs;
    var selectFavorites = true.obs;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productNo: json["product_no"],
        productName: json["product_name"],
        originalPrice: json["original_price"],
        offeredPrice: json["offered_price"],
        rating: json["rating"],
        productDetail: json["product_detail"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "product_no": productNo,
        "product_name": productName,
        "original_price": originalPrice,
        "offered_price": offeredPrice,
        "rating": rating,
        "product_detail": productDetail,
        "type": type,
    };
}
