import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/appuser_model.dart';

abstract class APIs {
  //firebase instance auth
  static FirebaseAuth auth = FirebaseAuth.instance;

  //for accessing to Firebase cloud database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  //current user
  static late AppUser me;

  //cheking if user exist or not
  static Future userExist() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  //get current user data
  static Future getSelfInfo() async {
    await firestore.collection('users').doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = AppUser.fromJson(user.data()!);
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  //creating new user
  static Future createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final appUser = AppUser(
      createAt: time,
      email: user.email.toString(),
      name: user.displayName.toString(),
      photoURl: user.photoURL.toString(),
      uid: user.uid,
    );

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(appUser.toJson())
        .then((value) => firestore
            .collection('users')
            .doc(user.uid)
            .collection('my_users')
            .add({'id': user.uid}));
  }

  //get my_devices id
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMyDevicesID() {
    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('my_devices')
        .snapshots();
  }

  //get my_divices list
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMyDevices(
      List<String> cardIDs) {
    log('My cards IDs: $cardIDs');
    return firestore
        .collection('devices')
        .where('cardID', whereIn: cardIDs)
        .snapshots();
  }

  //add my_device
  static Future addMyDevice(String cardID) async {
    final data = await firestore
        .collection('devices')
        .where('cardID', isEqualTo: cardID)
        .get();

    if (data.docs.isNotEmpty) {
      await firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_devices')
          .doc(data.docs.first.data()['cardID'])
          .set({});
    }
  }
}
