import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/controller/cart_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/cart/view/cart_tile.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.isLoading.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.red[200],
                      ),
                      Text(
                        cartController.statusMsj.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              } else if (cartController.cartList.isEmpty) {
                return Center(
                    child: Text(
                  cartController.statusMsj.toString(),
                  style: TextStyle(fontSize: 20),
                ));
              } else {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ListView.separated(
                      itemCount: cartController.cartList.length,
                      itemBuilder: (context, index) {
                        return CartTile(cartController.cartList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ));
              }
            }),
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).hoverColor,
        child: Row(
          children: [
            Expanded(
                child: GetX<CartController>(
              builder: (controller) {
                return Text(
                  "RM " + controller.totalPrice.toStringAsFixed(2) + " (" + controller.totalQty.toString() + " items)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                );
              },
            )),
            Expanded(
              child: MaterialButton(
                  color: Colors.red[200],
                  onPressed: () {},
                  child: Text(
                    "Pay",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Calibri'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
