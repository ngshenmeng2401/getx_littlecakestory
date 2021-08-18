import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/account/setting/theme_setting/controller/theme_setting_controller.dart';
import 'package:get/get.dart';

class ThemeSettingPage extends GetView<ThemeSettingController> {
  const ThemeSettingPage({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                GetBuilder<ThemeSettingController>(
                  init: ThemeSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title:
                          Text("Dark_Theme".tr, style: TextStyle(fontSize: 18)),
                      subtitle: Text("Dark_Theme_Desciption".tr,
                          style: TextStyle(fontSize: 14)),
                      trailing: Radio(
                        activeColor: Colors.red[200],
                        value: true,
                        groupValue: controller.isDarkMode,
                        onChanged: (value) {
                          controller.chooseLightTheme(value);
                        },
                      ),
                    );
                  },
                ),
                GetBuilder<ThemeSettingController>(
                  init: ThemeSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("Light_Theme".tr, style: TextStyle(fontSize: 18)),
                      subtitle: Text("Light_Theme_Desciption".tr,
                          style: TextStyle(fontSize: 14)),
                      trailing: Radio(
                        activeColor: Colors.red[200],
                        value: false,
                        groupValue: controller.isDarkMode,
                        onChanged: (value) {
                          controller.chooseLightTheme(value);
                        },
                      ),
                    );
                  },
                ),
                // GetBuilder<ThemeSettingController>(
                //   init: ThemeSettingController(),
                //   builder: (controller) {
                //     return ListTile(
                //       title: Text("System Default",
                //           style: TextStyle(fontSize: 18)),
                //       subtitle: Text(
                //           "The primary color will base on system theme",
                //           style: TextStyle(fontSize: 14)),
                //       trailing: Radio(
                //         activeColor: Colors.red[200],
                //         value: null,
                //         groupValue: false,
                //         onChanged: (value) {
                //           // controller.onClickRadioButton(value);
                //         },
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
