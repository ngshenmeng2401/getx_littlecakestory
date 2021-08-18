import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/route/app_pages.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LITTLE CAKE STORY"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // shadowColor: Get.theme.shadowColor,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.notifications,color: Colors.red[200]),
                  title: Text("Notifications".tr,style:TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.lock,color: Colors.red[200]),
                  title: Text("Change_Password".tr,style:TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.language,color: Colors.red[200]),
                  title: Text("Language".tr,style:TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    Get.toNamed(AppRoutes.LanguagePage);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.format_paint,color: Colors.red[200]),
                  title: Text("Theme".tr,style:TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    Get.toNamed(AppRoutes.ThemePage);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info,color: Colors.red[200]),
                  title: Text("About_Us".tr,style:TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.help,color: Colors.red[200]),
                  title: Text("Help_Support".tr,style:TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}