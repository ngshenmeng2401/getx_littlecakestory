import 'package:flutter/material.dart';

class CustomDarkTheme{
  static ThemeData get darktheme{

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      shadowColor: Colors.grey[800],
      accentColor: Colors.red[100],
      focusColor: Colors.red[100],
      fontFamily: 'Arial',
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.blueGrey[400], 
        cursorColor: Colors.blueGrey[300],
        selectionColor: Colors.red[200] 
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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.red[200],
        unselectedItemColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20.0, fontFamily: 'Calibri', color: Colors.red[200]),
        )
      ),
      cardColor: Colors.grey[900],
        );
  }
}
