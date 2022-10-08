import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/api/sign_in_api.dart';
import 'package:project_shopcart/authentication_page/models/login_model.dart';
import 'package:project_shopcart/homepage/views/home_screen.dart';

class LoginViewController extends GetxController {
  TextEditingController signInEmailControll = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  validated() async {
    if (formKey.currentState!.validate()) {}
  }

  checkLoginUser() async {
    validated();
    final SignInResponseModel responce = await SignInApi().signIn(
        email: signInEmailControll.text.trim(),
        password: signInPasswordController.text.trim());
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
    } else if (signInEmailControll.text.isEmpty &&
        signInPasswordController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: "Email and Password is required",
        duration: Duration(seconds: 2),
      ));
    } else if (signInPasswordController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: "Password is required",
        duration: Duration(seconds: 2),
      ));
    } else if (signInPasswordController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: "Password is required",
        duration: Duration(seconds: 2),
      ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "czv",
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  void dispose() {
    Get.delete<LoginViewController>();
    super.dispose();
  }
}
