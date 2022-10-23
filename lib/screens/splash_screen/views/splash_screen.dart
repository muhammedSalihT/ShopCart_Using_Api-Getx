import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/splash_screen/controllers/spalash_screenc_controller.dart';

class SpalshScreen extends GetView {
  SpalshScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'SALIH',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
