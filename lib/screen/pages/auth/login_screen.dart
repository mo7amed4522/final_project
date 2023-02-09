// ignore_for_file: avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:final_project/controller/auth_controller/login_controller.dart';
import 'package:final_project/core/constant/companet.dart';
import 'package:final_project/screen/widgets/auth_widget/custom_shape_appbar_widget.dart';
import 'package:final_project/screen/widgets/auth_widget/logo_shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSCreen extends StatelessWidget {
  const LoginSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 14, 195),
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => print('hello'),
                  child: Container(
                    height: 40.0,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<LoginScreenControllerIMP>(
        init: LoginScreenControllerIMP(),
        builder:(controller)=> Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                LogoAuthWidget(),
                Expanded(child: 
                ListView(
                children: [defaultTextForm(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    onTap: () {},
                    onChange: (String? vall) {},
                    onSubmit: (String? vall) {},
                    prefix: Icons.email_outlined,
                    color: Colors.white,
                    validate: (String? val) {
                      return val;
                    }),
                SizedBox(height: 20),
                defaultTextForm(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.emailAddress,
                    label: "Password",
                    onTap: () {},
                    onChange: (String? vall) {},
                    onSubmit: (String? vall) {},
                    prefix: Icons.email_outlined,
                    color: Colors.white,
                    validate: (String? val) {
                      return val;
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Your",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Transform.translate(
                      offset: Offset(0, 14),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Password ?",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 5),
                GestureDetector(
                  onTap: () {
                    controller.signIn();
                  },
                  child: animatedOptacity("Sign In"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Transform.translate(
                      offset: Offset(0, 1),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up ?",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17),],
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
