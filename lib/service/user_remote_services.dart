import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UserRemoteServices {

  static var client = http.Client();
  
  static Future<String?> signUpUser(String email, String username, String password) async {

    print(email);
    print(username);
    print(password);

    var response = await client.post(

    Uri.parse(
      "https://javathree99.com/s271059/getx_little_cake_story/signup_user.php"),
    body:{
      "email" : email,
      "username" : username,
      "password" : password,

    });
    print(response);
    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return resp;
    } else {
      //show error message
      return null;
    }
    
    // .then((response) {

    //   print(response.body);

    //   if(response.body=="success"){
    //     Fluttertoast.showToast(
    //     msg: "SignUp Success. Please check your email to vertify account.",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red[200],
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    //   }else{
    //     Fluttertoast.showToast(
    //     msg: "Registration Failed",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red[200],
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    //   }
    // });
    
  } 
}