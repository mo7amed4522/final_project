
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget defaultTextForm(
        {required TextEditingController controller,
        required TextInputType keyboardType,
        required String label,
        bool formEnable = true,
        bool readOnly = false,
        IconData? prefix,
        IconData? suffix,
        Function? suffixPress,
        Function? onSubmit,
        Function? onChange,
        Function? onTap,
        int? maxLength,
        int maxLines = 1,
        required color,
        required Function validate,
        bool isPassword = false}) =>
    Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 14, 195),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 55,
      width: Get.width,
      child: Row(
        children: [
          SizedBox(
            width: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  
                ),
              ),
            ),
          ),
          SizedBox(width: 7),
          Expanded(
            child: TextFormField(
                style: TextStyle(color: color),
                maxLength: maxLength,
                maxLines: maxLines,
                readOnly: readOnly,
                obscureText: isPassword,
                enabled: formEnable,
                controller: controller,
                keyboardType: keyboardType,
                onTap: () {
                  onTap!();
                },
                onFieldSubmitted: (value) {
                  onSubmit!(value);
                },
                onChanged: (value) {
                  onChange!(value);
                },
                validator: (s) {
                  return validate(s);
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      
                    ),
                    errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: label,
                    suffixIcon: suffix != null
                        ? IconButton(
                            onPressed: () {
                              suffixPress!();
                            },
                            icon: Icon(suffix, color: Colors.blue))
                        : null)),
          ),
        ],
      ),
    );


Widget animatedOptacity(String text) {
  return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: 0.99,
      child: Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 16, right: 40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Center(
                            child:Text(
                              text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ))))
              ])));
}