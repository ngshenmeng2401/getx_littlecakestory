import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/account/controller/account_controller.dart';
import 'package:flutter_getx_littlecakestory/pages/account/view/account_menu.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountPage extends GetView<AccountController> {

  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    String pathAsset='assets/images/profile.png';
    File? _image;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String? email = appData.read("keepLogin");

    return Scaffold(
      appBar: AppBar(
        title: Text("LITTLE CAKE STORY"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                height:screenHeight/5.6,
                width: screenWidth/3,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:Colors.red[200]!),
                        image: DecorationImage(
                          image: _image == null 
                          ? AssetImage(pathAsset)
                          : AssetImage(pathAsset),
                          fit: BoxFit.scaleDown,
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          shape: BoxShape.circle,
                        ),
                        child:IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(Icons.edit_outlined,
                          size:20,), 
                          onPressed: () {},
              
                        )
                      )
                    )
                  ],
                ),
              ),
              Text("User Name",
                style: TextStyle(
                  fontSize: 20,
              ),),
              SizedBox(height:5),
              Text("012- 4563214",
                style: TextStyle(
                  fontSize: 16,
              ),),
              SizedBox(height:5),
              Text("Email",
                style: TextStyle(
                  fontSize: 16,
              ),),
              AccountMenu(
                icon: Icon(Icons.history),
                text: "Payment History",
                press: (){
                  print(email);
                },
              ),
              AccountMenu(
                icon: Icon(Icons.favorite_outline),
                text: "Favourite",
                press: (){

                },
              ),
              AccountMenu(
                icon: Icon(Icons.settings),
                text: "Settings",
                press: (){
                  Get.toNamed(AppRoutes.SettingsPage);
                },
              ),
              AccountMenu(
                icon: Icon(Icons.logout, color: Colors.red),
                text: "Logout",
                press: (){
                  controller.logoutUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
