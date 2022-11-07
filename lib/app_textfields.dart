import 'package:flutter/material.dart';
import 'constants.dart';

class AppInputTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;

  const AppInputTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.h4BodyW,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyle.h4BodyG,
        labelText: label,
        labelStyle: AppTextStyle.h6BodyG,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AppColors.cGrayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AppColors.cGrayColor),
        ),
        contentPadding: const EdgeInsets.only(left: 16, top: 19, bottom: 19),
      ),
      obscureText: obscure,
    );
  }
}
