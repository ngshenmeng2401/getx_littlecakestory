import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo2.png",
            scale: 0.5,),
            CircularProgressIndicator(color: Colors.red[200],),
            SizedBox(height:10),
            Text("Loading"),
          ],
        ),
      )
    );
  }
}