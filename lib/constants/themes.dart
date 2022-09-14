
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:ecommerce/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData ThemeDatamode =
ThemeData(
    canvasColor: white,
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
        backgroundColor: white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: white,
          statusBarIconBrightness: Brightness.dark,

        ),
        iconTheme: IconThemeData(
            color: yellow
        ),
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: yellow,
            fontFamily: MyFont,
            fontSize: 25)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      unselectedItemColor: black,
      selectedLabelStyle: TextStyle(
          fontFamily: MyFont
      ),
    )
);