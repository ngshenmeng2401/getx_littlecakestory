import 'package:flutter/material.dart';


class CustomLightTheme{

  static ThemeData get lighttheme{

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red[200],
      shadowColor: Colors.grey[400],
      accentColor: Colors.red[200],
      focusColor: Colors.red[200],
      fontFamily: 'Arial',
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.blueGrey[300], 
        cursorColor: Colors.blueGrey[300],
        selectionColor: Colors.red[200],
      ),
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.red[200],
        focusColor: Colors.red[200],
        labelStyle: TextStyle(color: Colors.red[300]),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red[200]!)
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        
        backgroundColor: Colors.grey[350],
        selectedItemColor: Colors.red[200],
        unselectedItemColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red[200],
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20.0, fontFamily: 'Calibri', color: Colors.white),
        )
      ),
      cardColor: Colors.grey[200],
    );
  }
}
