import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserRemoteServices {

  static final appData = GetStorage();
  static var client = http.Client();
  
  static Future<String?> signUpUser(String email, String username, String password) async {

    print(email);
    print(username);
    print(password);
    
    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/getx_little_cake_story/signup_user.php'), 
      body: {
      "email" : email,
      "username" : username,
      "password" : password,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;

      Get.snackbar(resp,"Register " + resp);
      return resp;
    } else {
      //show error message
      return null;
      // throw Exception("Error");
    }
    
  }
  
  static Future<String?> loginUser(String email, String password ) async {

    print(email);
    print(password);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/getx_little_cake_story/login_user.php'), 
      body: {
      "email" : email,
      "password" : password,
    });
    if (response.statusCode == 200) {
      var resp = response.body;
      checkLogin(email,password);
      return resp;
    } else {
      //show error message
      return null;
      // throw Exception("Error");
    }
  }

  static void checkLogin(email, password) {

    if(email != "" && password != ""){
      print("Sucessful");

      appData.write("isLogged", true);
      appData.write("keepLogin", email);

      Get.offNamed(AppRoutes.BottomNavigation);

    }else {

      Get.snackbar("Error", "Please enter your email and password !!!");
    }

  }
}