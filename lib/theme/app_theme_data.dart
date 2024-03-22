import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izipizi/theme/pallets.dart';

const AppBarTheme appBarTheme = AppBarTheme(
  titleTextStyle: FontsPallet.titleMedium,
);

ThemeData appTheme = ThemeData(
  appBarTheme: appbarTheme,
  // primaryColorDark: ColorPallet.cCyan600,
  // primaryColor: ColorPallet.cCyan600,
  // focusColor: ColorPallet.cCyan600,
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: ColorPallet.cCyan600),
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: ColorPallet.cBG,
    primary: ColorPallet.cCyan600,
  ),
  elevatedButtonTheme: appelevationButtonTheme,
  outlinedButtonTheme: appoutlineButtonTheme,
  inputDecorationTheme: appinputDecorationTheme,
  floatingActionButtonTheme: appfloatingActionButtonThemeData,
);

const AppBarTheme appbarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: ColorPallet.cBG,
  foregroundColor: ColorPallet.cBG,
  titleTextStyle: FontsPallet.titleMedium,
  elevation: 0,
  iconTheme: IconThemeData(color: ColorPallet.cCyan600),
  surfaceTintColor: ColorPallet.cBG,
  systemOverlayStyle: SystemUiOverlayStyle(
    systemNavigationBarColor: ColorPallet.cBG,
    statusBarColor: ColorPallet.cBG,
  ),
);

ElevatedButtonThemeData appelevationButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
  overlayColor: MaterialStateProperty.all<Color>(
    ColorPallet.cWhite.withOpacity(0.2),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(ColorPallet.cCyan600),
  foregroundColor: MaterialStateProperty.all<Color>(ColorPallet.cWhite),
));

OutlinedButtonThemeData appoutlineButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    overlayColor: MaterialStateProperty.all<Color>(
      ColorPallet.cCyan600.withOpacity(0.2),
    ),
    side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: ColorPallet.cCyan600)),
    foregroundColor: MaterialStateProperty.all<Color>(ColorPallet.cWhite),
  ),
);

const InputDecorationTheme appinputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 16.0,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    borderSide: BorderSide(color: ColorPallet.cGrayContainer),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    borderSide: BorderSide(color: ColorPallet.cCyan600),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
  ),
  floatingLabelStyle: TextStyle(
    color: ColorPallet.cCyan600,
  ),
  hintStyle: TextStyle(
    fontWeight: FontWeight.normal,
    color: ColorPallet.cGrayContainer,
  ),
);

const FloatingActionButtonThemeData appfloatingActionButtonThemeData =
    FloatingActionButtonThemeData(
  backgroundColor: ColorPallet.cCyan600,
  foregroundColor: ColorPallet.cWhite,
);
