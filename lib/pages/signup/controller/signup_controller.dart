import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:flutter_getx_littlecakestory/service/user_remote_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  late TextEditingController emailController = new TextEditingController();
  late TextEditingController userNameController = new TextEditingController();
  late TextEditingController passwordController = new TextEditingController();
  late TextEditingController confirmPasswordController = new TextEditingController();

  void navigateLogin(){

    Get.offNamed(AppRoutes.Login);
  }

  void signUpDialog(){

    Get.defaultDialog(
      title: "Are you sure ?",
      content: Column(
        children: [
          Text("")
        ],
      ),
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        Get.back();
        checkSignUp();
      },
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.red[200],
    );
  }

  void checkSignUp(){

    String email = emailController.text.toString();
    String username = userNameController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();

    if(email.isEmpty && username.isEmpty && password.isEmpty && confirmPassword.isEmpty){

      Fluttertoast.showToast(
        msg: "Please fill in all textfield",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0);
      return;
    }else if (email.isEmpty){

      Fluttertoast.showToast(
        msg: "Email is empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0);
      return;
    }else if (username.isEmpty){

      Fluttertoast.showToast(
        msg: "UserName is empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0);
      return;
    }else if (password.isEmpty || confirmPassword.isEmpty){

      Fluttertoast.showToast(
        msg: "Password is empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0);
      return;
    }else if (password!=confirmPassword || confirmPassword!=password){

      Fluttertoast.showToast(
        msg: "Both Password are different",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0);
      return;
    }else{

      UserRemoteServices.signUpUser(email,username,password);
      
    }
  }
}