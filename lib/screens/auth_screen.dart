import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/main_screen.dart';
import '../helper/dialogs.dart';
import '../theme/pallets.dart';
import '../APIs/apis.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = 'auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n _signInWithGoogle: $e');
      if (!context.mounted) return null;
      // Dialogs.showErrorSnackBar(
      // context, 'Something went wrong, Check internet connection!');
      return null;
    }
  }

  handleGoogleButtonClick() {
    Dialogs.showProgressBar(context);

    signInWithGoogle().then((user) async {
      if (user != null) {
        debugPrint('User: ${user.user}');
        debugPrint('User: ${user.additionalUserInfo}');

        if (await APIs.userExist()) {
          if (!context.mounted) return;
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
        } else {
          await APIs.createUser().then((value) {
            if (!context.mounted) return;
            // Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Вітаємо у IZIPIZI.WORLD',
                  style: FontsPallet.titleBig,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Введіть свій логін та пароль чи скористайтесь Google',
                  style: FontsPallet.bodySmall
                      .copyWith(color: ColorPallet.cGrayText),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Логін',
                            hintText: 'simpleemailname@simple.domain'),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Пароль'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.of(context)
                            .pushReplacementNamed(MainScreen.routeName);
                      },
                      child: const Text('Увійти'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        color: ColorPallet.cGrayContainer,
                      )),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'чи',
                        style: FontsPallet.bodySmall
                            .copyWith(color: ColorPallet.cGrayText),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      const Expanded(
                          child: Divider(
                        color: ColorPallet.cGrayContainer,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: handleGoogleButtonClick,
                      icon: SvgPicture.asset('assets/svgs/google_logo.svg'),
                      label: const Text('Увійти за допомогою Google'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
