import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/controller/cart_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/model/cart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartTile extends GetView<CartController> {
  final Cart cart;
  CartTile(this.cart);
  final cartController = Get.put(CartController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String? email = appData.read("keepLogin");
    double totalPrice = double.parse(cart.totalPrice);

    return Card(
        elevation: 2,
        child: Container(
            width: double.infinity,
            height: screenHeight / 6.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://javathree99.com/s271059/littlecakestory/images/product/${cart.productNo}.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                            child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                          // color: Colors.red[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenWidth / 2.5,
                                child: Text(
                                  cart.productName.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                "RM " + cart.productPrice.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                        Flexible(
                            child: Container(
                          // color: Colors.red[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(width: screenWidth / 3),
                              Container(
                                width: screenWidth / 3.95,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cartController.checkCalculationQty("remove",cart.productPrice,cart.productNo,int.parse(cart.productQty));
                                      },
                                      icon: Icon(Icons.remove_circle_outline,
                                          color: Colors.red[200], size: 22),
                                    ),
                                    // GetBuilder<CartController>(
                                    //   init: CartController(),
                                    //   initState: (_) {},
                                    //   builder: (_) {
                                    //     return Text(cartController.productQty.toString());
                                    //   },
                                    // ),
                                    Text(cart.productQty),
                                    IconButton(
                                      onPressed: () {

                                        // int qty = int.parse(cart.productQty);
                                        // num += qty;
                                        // print(num);
                                        cartController.checkCalculationQty("add",cart.productPrice,cart.productNo,int.parse(cart.productQty));
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.red[200],
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                        Flexible(
                            child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                          // color: Colors.red[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price (RM):",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                totalPrice.toStringAsFixed(2),
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
