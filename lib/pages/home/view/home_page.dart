import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/home/controller/home_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'product_tile.dart';

class HomePage extends StatelessWidget {
  
  final homeController = Get.put(HomeController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:Text("LITTLE CAKE STORY")
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx((){
              if(homeController.isLoading.value){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.red[200],
                      ),
                      Text(
                        homeController.statusMsj.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }else if(homeController.productList == null){
                return Center(
                  child: Text(
                    homeController.statusMsj.toString(),
                    style: TextStyle(fontSize: 20),
                ));

              }else{
                return Padding(
                  padding:const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2, 
                    itemCount: homeController.productList.length,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemBuilder: (context,index){
                      return ProductTile(homeController.productList[index]);
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