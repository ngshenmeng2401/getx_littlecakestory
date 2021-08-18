import 'dart:convert';
import 'package:get/get.dart';

List<Favourite> favouriteFromJson(String str) => List<Favourite>.from(json.decode(str).map((x) => Favourite.fromJson(x)));

String favouriteToJson(List<Favourite> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favourite {
    Favourite({
        this.productNo,
        this.productName,
        this.originalPrice,
        this.offeredPrice,
        this.rating,
        this.productDetail,
        this.type,
        this.status,
    });

    String? productNo;
    String? productName;
    String? originalPrice;
    String? offeredPrice;
    String? rating;
    String? productDetail;
    String? type;
    String? status;

    final isFavorite = true.obs;

    factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        productNo: json["product_no"],
        productName: json["product_name"],
        originalPrice: json["original_price"],
        offeredPrice: json["offered_price"],
        rating: json["rating"],
        productDetail: json["product_detail"],
        type: json["type"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "product_no": productNo,
        "product_name": productName,
        "original_price": originalPrice,
        "offered_price": offeredPrice,
        "rating": rating,
        "product_detail": productDetail,
        "type": type,
        "status": status,
    };
}
