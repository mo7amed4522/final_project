import 'package:final_project/controller/users/auth_controller.dart';
import 'package:final_project/controller/users/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginScreenController extends GetxController {
  signIn();
}

class LoginScreenControllerIMP extends LoginScreenController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();
  final formKey = GlobalKey<FormState>();

  @override
  signIn() {
    if (formKey.currentState!.validate()) {
      authController.login();
      if (kDebugMode) {
        print("true");
      }
    }
    if (kDebugMode) {
      print("false");
    }
  }
}
