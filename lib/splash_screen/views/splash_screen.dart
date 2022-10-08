import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/splash_screen/controllers/spalash_screenc_controller.dart';

class SpalshScreen extends StatelessWidget {
  SpalshScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashController.getScreen();
    });
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
