import 'package:flutter/material.dart';
import 'package:flutter_getx_littlecakestory/pages/account/setting/language_setting/controller/language_controller.dart';
import 'package:get/get.dart';

class LanguageSettingPage extends StatelessWidget {
  const LanguageSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Language".tr),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                GetBuilder<LanguageSettingController>(
                  init: LanguageSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("English"),
                      trailing: Radio(
                          activeColor: Colors.red[200],
                          value: controller.language[0],
                          groupValue: controller.selectLanguage,
                          onChanged: (value) {
                            controller.clickLanguage(value);
                          }),
                    );
                  },
                ),
                GetBuilder<LanguageSettingController>(
                  init: LanguageSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("华语简体"),
                      trailing: Radio(
                          activeColor: Colors.red[200],
                          value: controller.language[1],
                          groupValue: controller.selectLanguage,
                          onChanged: (value) {
                            controller.clickLanguage(value);
                          }),
                    );
                  },
                ),
                GetBuilder<LanguageSettingController>(
                  init: LanguageSettingController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("華語繁體"),
                      trailing: Radio(
                          activeColor: Colors.red[200],
                          value: controller.language[2],
                          groupValue: controller.selectLanguage,
                          onChanged: (value) {
                            controller.clickLanguage(value);
                          }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
