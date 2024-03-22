import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izipizi/screens/add_device_screen.dart';
import 'package:izipizi/screens/main_screen.dart';
import 'package:izipizi/screens/news_screen.dart';
import 'package:izipizi/screens/profile_screen.dart';
import 'package:izipizi/screens/share_screen.dart';
import 'package:izipizi/screens/welcome_screen.dart';

import '../firebase_options.dart';

import '../screens/auth_screen.dart';
import '../screens/contact_screen.dart';
import 'screens/devices_screen.dart';
import '../theme/app_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initialFirebase();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const IziPiziApp());
}

class IziPiziApp extends StatelessWidget {
  const IziPiziApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const WelcomeScreen(),
      routes: {
        ContactScreen.routeName: (context) => ContactScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        DevicesScreen.routeName: (context) => const DevicesScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        NewsScreen.routeName: (context) => const NewsScreen(),
        ShareScreen.routeName: (context) => const ShareScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        AddDeviceScreen.routeName: (context) => const AddDeviceScreen(),
      },
    );
  }
}

_initialFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
