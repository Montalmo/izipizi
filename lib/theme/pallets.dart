import 'package:flutter/material.dart';

abstract class FontsPallet {
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleBig = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyBig = TextStyle(
    fontSize: 18.0,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
  );
}

//App Colors

abstract class ColorPallet {
  static const Color cBG = Color.fromRGBO(29, 31, 34, 1);
  static const Color cBGContainer = Color.fromRGBO(20, 21, 24, 1);
  static const Color cCyan600 = Color.fromRGBO(4, 179, 239, 1);
  static const Color cBlue600 = Color.fromRGBO(84, 130, 241, 1);
  static const Color cRed600 = Color.fromRGBO(241, 103, 84, 1);
  static const Color cPink600 = Color.fromRGBO(228, 76, 168, 1);
  static const Color cGreen600 = Color.fromRGBO(29, 181, 90, 1);
  static const Color cYellow600 = Color.fromRGBO(221, 159, 39, 1);
  static const Color cViolet600 = Color.fromRGBO(130, 67, 210, 1);
  static const Color cCyanGrey600 = Color.fromRGBO(103, 170, 206, 1);
  static const Color cGrayText = Color.fromRGBO(151, 151, 157, 1);
  static const Color cGrayContainer = Color.fromRGBO(65, 67, 73, 1);
  static const Color cGrayDarkContainer = Color.fromRGBO(45, 47, 51, 1);
  static const Color cWhite = Color.fromRGBO(255, 255, 255, 1);

  //App Gradients

  static const BoxShadow sContainer = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .25),
    spreadRadius: 0,
    blurRadius: 16.0,
    offset: Offset(0, 4),
  );

  //App Gradients

  static const LinearGradient gCyan = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color.fromRGBO(31, 215, 210, 1),
        Color.fromRGBO(4, 179, 239, 1),
        Color.fromRGBO(29, 117, 206, 1),
      ]);

  static const LinearGradient gViolet = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color.fromRGBO(113, 62, 221, 1),
        Color.fromRGBO(164, 4, 239, 1),
        Color.fromRGBO(142, 0, 144, 1),
      ]);

  static const LinearGradient gOrange = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color.fromRGBO(215, 186, 31, 1),
        Color.fromRGBO(239, 131, 4, 1),
        Color.fromRGBO(206, 29, 29, 1),
      ]);

  static const LinearGradient gGreen = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color.fromRGBO(207, 243, 170, 1),
        Color.fromRGBO(25, 218, 102, 1),
        Color.fromRGBO(0, 177, 60, 1),
      ]);
}
