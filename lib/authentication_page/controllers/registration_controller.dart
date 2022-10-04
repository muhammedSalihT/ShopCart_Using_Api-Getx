import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/api/registration_api.dart';
import 'package:project_shopcart/authentication_page/models/registration_model.dart';
import 'package:project_shopcart/homepage/views/home_screen.dart';

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
    final userModel = ResUser(
      id: '',
      name: nameController.text,
      password: passwordController.text.trim(),
      email: reigsterEmailControll.text.trim(),
      type: '',
    );
    final SignUpResponseModel responce =
        await RegistrationApi().signupUser(userModel);
    if (responce.status != null) {
      if (responce.status == true) {
        Get.showSnackbar(GetSnackBar(
          message: responce.msg,
          duration: const Duration(seconds: 2),
        ));
        Get.to(HomeScreen());
      } else {
        Get.showSnackbar(GetSnackBar(
          message: responce.msg,
          duration: const Duration(seconds: 2),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: responce.msg.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
