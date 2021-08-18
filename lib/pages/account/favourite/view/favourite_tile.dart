import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/model/favourite.dart';
import 'package:flutter_getx_littlecakestory/pages/account/favourite/controller/favourite_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/home/model/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteProductTile extends GetView<FavouriteController> {

  final Product product;
  FavouriteProductTile(this.product);
  final favouriteController = Get.put(FavouriteController());  
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return Card(
      elevation: 2,
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                    imageUrl:
                        "https://javathree99.com/s271059/littlecakestory/images/product/${product.productNo}.png",
                    height: 185,
                    width: 185,
                    placeholder: (context, url) => new Transform.scale(
                        scale: 0.5,
                        child: CircularProgressIndicator(
                          color: Colors.red[200],
                        )),
                    errorWidget: (context, url, error) => new Icon(
                          Icons.broken_image,
                          size: screenWidth / 3,
                        )),
              ),
              Positioned(
                top: 3,
                right: 2,
                child: Obx(() => CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    icon: product.isFavorite.value == true
                        ? Icon(Icons.favorite_rounded,color: Colors.red,)
                        : Icon(Icons.favorite_border,color: Colors.red[200],),
                    onPressed: () {
                      // print(email);
                        product.isFavorite.toggle();
                        // favouriteController.removeFavorite(product.productNo);
                    },
                  ),
                )))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                    // color: Colors.amberAccent,
                    child: Text(
                      product.productName.toString(),
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                    // color: Colors.amber,
                    child: Text(
                      "RM " + product.originalPrice.toString(),
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: Text(product.rating.toString())),
                    Icon(
                      Icons.star_rate,
                      size: 18,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
                Container(
                  // color: Colors.blue,
                  height: 30,
                  child: MaterialButton(
                    minWidth: 70,
                    // height:18,
                    color: Colors.red[200],
                    textColor: Colors.white,
                    onPressed: () {
                      // cartController.addToOnlineCart(product);
                    },
                    child: Text("Add to cart"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}