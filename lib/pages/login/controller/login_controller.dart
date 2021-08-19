import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:flutter_getx_littlecakestory/service/user_remote_services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  final GlobalKey <FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController, forgotPasswordEmailController;
  

  final appData = GetStorage(); 

  var email = '';
  var password = '';
  var rememberMe = false;

  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    forgotPasswordEmailController = TextEditingController();
    loadPreference();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void navigateSignUp(){

    Get.offNamed(AppRoutes.Signup);
  }

  void rememberEmailPassword (value, email, password){

    if(email.isEmpty || password.isEmpty){

      Get.bottomSheet(
        Container(
          height: 30,
          color: Colors.red[200],
          child: Column(
            children: [
              Text("Email_Password_is_empty".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16),)
            ],
          ),
        )
      );
      return;
    }
    // print(rememberMe);
    rememberMe = value;
    print(rememberMe);
    storePreference(value, email, password);
    update();
  }

  Future<void> storePreference(bool value,String email, String password) async {
    
    if(value==true){

      appData.write("email", email);
      appData.write("password", password);
      appData.write("rememberme", value);

      Get.bottomSheet(
        Container(
          height: 30,
          color: Colors.red[200],
          child: Column(
            children: [
              Text("Email_Password_stored".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16),)
            ],
          ),
        )
      );
    return;
    }else{  
      
      appData.write("email", '');
      appData.write("password", '');
      appData.write("rememberme", value);

      Get.bottomSheet(
        Container(
          height: 30,
          color: Colors.red[200],
          child: Column(
            children: [
              Text("Removed_Email_Password".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16),)
            ],
          ),
        )
      );
      emailController.text = "";
      passwordController.text = "";
      rememberMe = false ;
      update();
      return;
    }
  }

  Future<void> loadPreference()async {

    String email = appData.read("email")??'';
    String password = appData.read("password")??'';
    rememberMe= (appData.read("rememberme")??false);

    emailController.text=email;
    passwordController.text=password;
    update();
  }

  void forgotPasswordDialog(){

    Get.defaultDialog(
      title: "Forgot_Your_Password".tr,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            child: TextField(
              controller: forgotPasswordEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email".tr
              ),
            ),
          )
        ],
      ),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => Get.back(),
      onCancel: () => Get.back(),
      cancelTextColor: Colors.red[200],
      confirmTextColor: Colors.white,
      buttonColor: Colors.red[200],
    );
  }

  void loginUser(){

    print(emailController.text.toString());
    print(passwordController.text.toString());

    UserRemoteServices.loginUser(emailController.text.toString(), passwordController.text.toString());
  }

  void loginAsGuest(){

    Get.offNamed(AppRoutes.BottomNavigation);
  }
}