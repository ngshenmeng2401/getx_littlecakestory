import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                  child: Image.asset('assets/images/logo2.png',
                    height: screenHeight / 4,
                    width: screenWidth / 1.1,),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red[200]!),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15,0,15,0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _.emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                icon: Icon(Icons.email,
                                  color: Colors.red[200],)),
                            ),
                          );
                        },
                      ),
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15,0,15,0),
                            child: TextField(
                              controller: _.passwordController,
                              decoration:
                                  InputDecoration(
                                    labelText: "Password",
                                    icon: Icon(Icons.lock,
                                      color: Colors.red[200],)),
                              obscureText: true,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller) {
                              return Checkbox(
                                value: controller.rememberMe,
                                activeColor: Colors.red[200],
                                onChanged: (value) {
                                  controller.rememberEmailPassword(
                                    value!,
                                    controller.emailController.text
                                        .toString(),
                                    controller.passwordController.text
                                        .toString());
                                });
                            },
                          ),
                          Text("Remember Me"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.forgotPasswordDialog();
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.red[200],
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    ],
                  )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: screenHeight/18,
                          color: Colors.red[200],
                          onPressed: () {
                            controller.loginUser();
                          },
                          child: Text("Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            )),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        flex: 2,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: screenHeight/18,
                          color: Colors.red[200],
                          onPressed: () {
                            controller.navigateSignUp();
                          },
                          child: Text("Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            )),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight/18,
                  minWidth: screenWidth/1.14,
                  color: Colors.red[200],
                  onPressed:(){
                    controller.loginAsGuest();
                  },
                  child: Text("Continue as A Guest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}