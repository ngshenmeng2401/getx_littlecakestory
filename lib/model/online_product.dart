import 'dart:convert';
import 'package:get/get.dart';

List<OnlineProduct> onlineProductFromJson(String str) => 
List<OnlineProduct>.from(json.decode(str).map((x) => OnlineProduct.fromJson(x)));

String onlineProductToJson(List<OnlineProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnlineProduct {
    OnlineProduct({
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

    final isFavorite = false.obs;

    factory OnlineProduct.fromJson(Map<String, dynamic> json) => OnlineProduct(
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
