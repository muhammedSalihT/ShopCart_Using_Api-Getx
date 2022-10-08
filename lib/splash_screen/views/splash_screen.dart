import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/splash_screen/controllers/spalash_screenc_controller.dart';

class SpalshScreen extends StatelessWidget {
  SpalshScreen({Key? key}) : super(key: key);

  final splashController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    log("called splash view");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashController.getScreen();
    });
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
