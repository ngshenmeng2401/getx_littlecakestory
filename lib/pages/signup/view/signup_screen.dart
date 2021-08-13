import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(25,70,25,10),
            child: Column(
              children: [
                Image.asset('assets/images/logo2.png',
                  height: screenHeight / 4,
                  width: screenWidth / 1.1,),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red[200]!),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            icon: Icon(Icons.email,
                              color: Colors.red[200],)),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: controller.userNameController,
                          decoration: InputDecoration(
                            labelText: "User Name",
                            icon: Icon(Icons.people,
                              color: Colors.red[200],)),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            icon: Icon(Icons.lock,
                              color: Colors.red[200],)),
                            obscureText: true,
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,15),
                        child: TextField(
                          controller: controller.confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            icon: Icon(Icons.lock,
                              color: Colors.red[200],),
                            ),
                          obscureText: true,
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight/18,
                  minWidth: screenWidth/1.14,
                  color: Colors.red[200],
                  onPressed: (){
                    controller.signUpDialog();
                  },
                  child: Text("Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    )),
                ),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      )),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        controller.navigateLogin();
                      },
                      child: Text("Login",
                      style: TextStyle(
                        color: Colors.red[200],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                    )
                  ],
                )
              ],
            ),
          )
        ),
      )
    );
  }
}