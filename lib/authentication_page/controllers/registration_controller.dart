import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/api/registration_api.dart';
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

  validated() {
    if (formKey.currentState!.validate()) {}
  }

  checkRegister() async {
    validated();
    final obj = SignUpModel(
        userMail: reigsterEmailControll.text.trim(),
        userPassword: registerPasswordController.text.trim());

    final SignUpRespoModel responce = await RegistrationApi().signupUser(obj);
    if (responce.status != null) {
      if (responce.status == true) {
        Get.showSnackbar(const GetSnackBar(
          message: "Please enter OTP to complete",
          duration: Duration(seconds: 2),
        ));
        Get.to(VerificationScreeen(
          userId: responce.id!,
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          message: responce.message.toString(),
          duration: const Duration(seconds: 2),
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
