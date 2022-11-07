import 'package:flutter/material.dart';
import 'package:izipizi/strings.dart';

abstract class AppColors {
  static const Color cWhiteColor = Color(0xFFFFFFFF);
  static const Color cGrayColor = Color(0xFFC4CBDD);
  static const Color cGrayBGColor = Color(0xFFFAFBFF);
  static const Color cBlueColor = Color(0xFF5482F1);
  static const Color cRedColor = Color(0xFFF16754);
  static const Color cGreenColor = Color(0xFF7EE475);
  static const Color cGrayBGDarkColor = Color(0x1A000000);
  static const Color cGrayDarkColor = Color(0xFF595D67);
  static const Color cBlueShadowColor = Color(0x330D2A45);
  static const Color cGrayShadowColor = Color(0x26000000);
  static const Color cBlackBGDarkColor = Color(0xFF1A1A1A);
  static const Color cHoverBlueColor = Color.fromARGB(87, 84, 130, 241);
}

abstract class AppTextStyle {
  static const TextStyle h1Title = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.cWhiteColor);
  static const TextStyle h2Title = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 20.0,
      fontWeight: FontWeight.w600);
  static const TextStyle h3Title = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.w600);
  static const TextStyle h4Title = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.cWhiteColor);
  static const TextStyle h4TitleG = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.cGrayColor);
  static const TextStyle h4BodyW = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cWhiteColor);
  static const TextStyle h4BodyB = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cBlueColor);
  static const TextStyle h4BodyG = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cGrayDarkColor);
  static const TextStyle h5Title = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w600);
  static const TextStyle h5Body = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cWhiteColor);
  static const TextStyle h5BodyG = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cGrayBGColor);
  static const TextStyle h6BodyW = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cWhiteColor);
  static const TextStyle h6BodyG = TextStyle(
      fontFamily: AppStrings.appFontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.cGrayBGColor);
}

abstract class AppPaddings {
  static const EdgeInsetsGeometry pagePadding =
      EdgeInsets.symmetric(vertical: 24, horizontal: 32.0);
}

abstract class AppSizedBoxes {
  static const SizedBox sizedBoxH40 = SizedBox(height: 40.0);
  static const SizedBox sizedBoxH32 = SizedBox(height: 32.0);
  static const SizedBox sizedBoxH24 = SizedBox(height: 24.0);
  static const SizedBox sizedBoxH16 = SizedBox(height: 16.0);
  static const SizedBox sizedBoxH8 = SizedBox(height: 8.0);
}
