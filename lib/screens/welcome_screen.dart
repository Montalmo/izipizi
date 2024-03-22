import 'package:flutter/material.dart';
import 'package:izipizi/screens/auth_screen.dart';

import '../theme/pallets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const routeName = 'welcome-screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size mqd = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: mqd.width - 64,
              child: Image.asset('assets/images/welcome_illustrations.png'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              'Вітаємо у IZIPIZI.WORLD',
              style: FontsPallet.titleBig,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'Увійдіть у свій аккаунт чи зареєструйтесь',
              style:
                  FontsPallet.bodySmall.copyWith(color: ColorPallet.cGrayText),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Регітрація'),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AuthScreen.routeName,
                        );
                      },
                      child: const Text('Увійти'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
