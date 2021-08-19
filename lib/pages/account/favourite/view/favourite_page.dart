import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/account/favourite/controller/favourite_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'favourite_tile.dart';

class FavouritePage extends StatelessWidget {

  final favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx((){
              if(favouriteController.isLoading.value){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.red[200],
                      ),
                      Text(
                        favouriteController.statusMsj.toString().tr,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }else if(favouriteController.productList.isEmpty){
                return Center(
                  child: Text(
                    favouriteController.statusMsj.toString().tr,
                    style: TextStyle(fontSize: 20),
                ));

              }else{
                return Padding(
                  padding:const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2, 
                    itemCount: favouriteController.productList.length,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemBuilder: (context,index){
                      return FavouriteProductTile(favouriteController.productList[index]);
                    }, 
                  staggeredTileBuilder: (index)=>StaggeredTile.fit(1)),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}