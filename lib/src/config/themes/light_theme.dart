import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.green,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.grey[50],
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
      shape: MaterialStateProperty.all(
        StadiumBorder(),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
      shape: MaterialStateProperty.all(
        StadiumBorder(),
      ),
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(
      AppConstrant.appColorBlack,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);

TextStyle appSubTitle = TextStyle(
  color: AppConstrant.appColorGra,
);
TextStyle appTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: AppConstrant.appColorLightBlack2,
);
