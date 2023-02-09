import 'package:final_project/models/users.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

  UserModel get user => userModel.value;

  set user(UserModel value) => userModel.value = value;

  void clear() {
    userModel.value = UserModel();
  }
}