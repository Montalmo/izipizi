import 'package:flutter/material.dart';
import 'package:izipizi/constants.dart';
import 'package:izipizi/pages/auth_page.dart';
//little comment

void main() {
  runApp(const IzipiziApp());
}

class IzipiziApp extends StatelessWidget {
  const IzipiziApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.cBlackBGDarkColor,
        body: AuthPage(),
      ),
    );
  }
}
