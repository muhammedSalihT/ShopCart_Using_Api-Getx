import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/api/auth_api.dart';
import 'package:project_shopcart/authentication_page/models/registration_model.dart';
import 'package:project_shopcart/authentication_page/views/verification_screen.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController reigsterEmailControll = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberControlletr = TextEditingController();

  validated() async {
    if (formKey.currentState!.validate()) {
    }
      final obj = SignUpModel(
          userMail: reigsterEmailControll.text.trim(),
          userPassword: registerPasswordController.text.trim());

      final SignUpRespoModel responce = await AuthApi().signupUser(obj);
      if (responce.status != null) {
        if (responce.status == true) {
          log('${responce.status}');
          Get.to(VerificationScreeen());
        } else {
          Get.showSnackbar(GetSnackBar(
            message: responce.message.toString(),
          ));
        }
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "No network",
          duration: Duration(seconds: 2),
        ));
      }
    }
  }
