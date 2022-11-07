import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izipizi/app_buttons.dart';
import 'package:izipizi/app_textfields.dart';
import 'package:izipizi/constants.dart';
import 'package:izipizi/strings.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    double cont = MediaQuery.of(context).size.width;
    print(cont);

    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            AppSizedBoxes.sizedBoxH40,
            Container(
              alignment: Alignment.topCenter,
              height: cont / 2,
              child: Row(
                children: [
                  SvgPicture.asset(AppStrings.logoSVG),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Ласкаво просимо до нашого додатку',
                  style: AppTextStyle.h1Title,
                ),
                AppSizedBoxes.sizedBoxH32,
                AppInputTextField(
                    label: 'Номер телефону', hint: '+38 0XX XXX XX XX'),
                AppSizedBoxes.sizedBoxH16,
                AppInputTextField(
                  label: 'Пароль',
                  hint: '',
                  obscure: true,
                ),
                AppSizedBoxes.sizedBoxH24,
                AppTextButton(
                    title: 'Забули пароль? Відновити зараз',
                    textStyle: AppTextStyle.h4BodyB),
                AppSizedBoxes.sizedBoxH24,
                AppButton.primary(title: 'Вхід',),
                AppSizedBoxes.sizedBoxH8,
                AppButton.secondary(title: 'Реєстрація'),
                AppSizedBoxes.sizedBoxH8,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
