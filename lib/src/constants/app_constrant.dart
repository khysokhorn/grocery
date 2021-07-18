import 'package:flutter/material.dart';

class AppConstrant {
  //============== color ==============//
  static Color appColorGrayCardBG = Colors.grey.withOpacity(0.6);
  static Color appColorGra = Colors.grey;
  static Color appColorLightBlack = Colors.black54;
  static Color  appColorBlack = Colors.black;
  static Color appColorPrimaryColor = Colors.green;
  static Color appColorRed = Colors.redAccent;
  static Color appColorWhite = Colors.white70;
  static Color appColorLightBlack2 =  Colors.black87;
}

//============== dimension ==============//
const double appDmPrimary = 15.0;

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
