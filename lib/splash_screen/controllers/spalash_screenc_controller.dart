import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/views/authentication_screen.dart';
import 'package:project_shopcart/onbording_pages/view/onbording_screens_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  Future<void> getScreen() async {
    log('called splash controller');
    final shared = await SharedPreferences.getInstance();
    final checkResult = shared.getBool("isScreen") ?? false;
    if (checkResult) {
      await Future.delayed(
        const Duration(seconds: 5),
      );
      Get.offAll(const AuthScreen());
    } else {
      await Future.delayed(
        const Duration(seconds: 5),
      );
      Get.to(OnBordingScreen());
    }
  }
}
