import 'package:flutter/material.dart';
import 'package:izipizi/constants.dart';

class AppButton extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final Color color;
  final Color hoverColor;
  final Color disableColor;
  final Color borderColor;
  bool isActive = true;

  AppButton.primary({
    super.key,
    required this.title,
    this.titleStyle = AppTextStyle.h4Title,
    this.borderColor = AppColors.cBlueColor,
    this.color = AppColors.cBlueColor,
    this.hoverColor = AppColors.cHoverBlueColor,
    this.disableColor = AppColors.cGrayDarkColor,
  });

  AppButton.secondary({
    super.key,
    required this.title,
    this.titleStyle = AppTextStyle.h4TitleG,
    this.borderColor = AppColors.cGrayColor,
    this.color = AppColors.cBlackBGDarkColor,
    this.hoverColor = AppColors.cGrayBGDarkColor,
    this.disableColor = AppColors.cGrayDarkColor,
  });

  AppButton.alert({
    super.key,
    required this.title,
    this.titleStyle = AppTextStyle.h4Title,
    this.borderColor = AppColors.cRedColor,
    this.color = AppColors.cRedColor,
    this.hoverColor = AppColors.cHoverBlueColor,
    this.disableColor = AppColors.cGrayDarkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? color : disableColor,
      borderRadius: BorderRadius.circular(5.0),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        splashColor: hoverColor,
        onTap: isActive ? () {} : null,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: isActive ? borderColor : disableColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: titleStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String title;
  final TextStyle textStyle;

  const AppTextButton(
      {super.key, required this.title, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
