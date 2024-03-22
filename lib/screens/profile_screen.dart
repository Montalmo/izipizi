import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:izipizi/APIs/apis.dart';
import 'package:izipizi/screens/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = 'profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Profile screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Вийти'),
        icon: const Icon(Icons.logout_rounded),
        backgroundColor: Colors.red[400],
        onPressed: () {
          APIs.auth.signOut().then((value) async {
            await GoogleSignIn().signOut().then((value) {
              APIs.auth = FirebaseAuth.instance;
            });
            if (context.mounted) {
              Navigator.of(context).pushReplacementNamed(
                WelcomeScreen.routeName,
              );
            }
          });
        },
      ),
    );
  }
}
