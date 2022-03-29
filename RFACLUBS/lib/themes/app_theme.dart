import 'package:flutter/material.dart';


class AppTheme{

  static const double globalElevation = 0;
  

   /* static final ThemeData LightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 241, 0, 0),
      
      
      elevation: globalElevation
      ),
      scaffoldBackgroundColor: Colors.white,
    
      //appbar
      
    );*/
    static final DarkTheme = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
      foregroundColor: Color.fromARGB(255, 0, 0, 0),
      backgroundColor: Color.fromARGB(255, 218, 181, 15),
      centerTitle: true,
      elevation: globalElevation),
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),

      inputDecorationTheme: const InputDecorationTheme(
      focusColor: Color.fromARGB(255, 5, 5, 5),
      
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 42, 61, 63),
          ),
        ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 204, 47, 19),
            width: 2.0,
          ),
        ),
      ),
      );
    
}