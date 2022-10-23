import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/authentication_page/controllers/registration_controller.dart';
import 'package:project_shopcart/screens/authentication_page/views/authentication_screen.dart';
import 'package:project_shopcart/screens/global_screen/views/global_screen.dart';
import 'package:project_shopcart/screens/onbording_pages/view/onbording_screens_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
 
  final registrationController = Get.put(RegistrationController());
   
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getScreen();
    });
    super.onInit();
  }

  Future<void> getScreen() async {
    log('called splash controller');
    final shared = await SharedPreferences.getInstance();
    final checkResult = shared.getBool("isScreen") ?? false;
    final value = await registrationController.loadUser();
    if (checkResult && value != '') {
      await Future.delayed(
        const Duration(seconds: 5),
      );
      Get.off(() => GlobalScrren());
    } else if (checkResult) {
      await Future.delayed(
        const Duration(seconds: 5),
      );
      Get.off(() => const AuthScreen());
    } else {
      await Future.delayed(
        const Duration(seconds: 5),
      );
      Get.off(() => OnBordingScreen());
    }
  }
}
