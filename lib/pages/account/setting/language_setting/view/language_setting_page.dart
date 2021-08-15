import 'package:flutter/material.dart';

class LanguageSettingPage extends StatelessWidget {
  const LanguageSettingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int? languageButton;

    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  title: Text("English"),
                  trailing: Radio(
                    activeColor: Colors.red[200],
                    value: 1, 
                    groupValue: languageButton, 
                    onChanged: (value){}),
                ),
                ListTile(
                  title: Text("华语"),
                  trailing: Radio(
                    activeColor: Colors.red[200],
                    value: 2, 
                    groupValue: languageButton, 
                    onChanged: (value){}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}