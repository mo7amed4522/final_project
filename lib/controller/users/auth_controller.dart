// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:final_project/controller/users/user_controller.dart';
import 'package:final_project/models/users.dart';
import 'package:final_project/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
   FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  Rx<int> axisCount = 2.obs;

  User get user => firebaseUser.value!;

  @override
  void onInit() {
    firebaseUser = Rx<User>(_auth.currentUser!);
    firebaseUser.bindStream(_auth.userChanges());
    super.onInit();
  }

  void createUser() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((value) {
        UserModel _user = UserModel(
          id: value.user!.uid,
          name: name.text,
          email: email.text,
        );
        Database().createNewUser(_user).then((value) {
          if (value) {
            Get.find<UserController>().user = _user;
            Get.back();
            _clearControllers();
          }
        });
      });
    } catch (e) {
      Get.snackbar(
        'Error creating account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login() async {
    try {
      if (kDebugMode) {
        print("IN logging in email ${email.text} password ${password.text}");
      }
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.find<UserController>().user =
          await Database().getUser(userCredential.user!.uid);
      _clearControllers();
    } catch (e) {
      Get.snackbar(
        'Error logging in',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signout() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().user = UserModel();
    } catch (e) {
      Get.snackbar(
        'Error signing out',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}