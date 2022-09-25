import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/api/verification_api.dart';
import 'package:project_shopcart/homepage/views/home_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_controller.dart';

class VerificationController extends GetxController {
  CountdownController countdownController =
      CountdownController(autoStart: true);

  TextEditingController textEditingController = TextEditingController();

  var messegageOtpCode = ''.obs;
  var code = '';
  @override
  void onInit() async {
    super.onInit();
    await SmsAutoFill().listenForCode();
  }

  verifyUser(String userId) async {
    final responce =
        await VerificationApi().verify(textEditingController.text, userId);

    if (responce!["status"] == true) {
      Get.showSnackbar(const GetSnackBar(
        message: "welcome..signup successfully",
        duration: Duration(seconds: 2),
      ));
      Get.offAll(HomeScreen());
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Ooops..Enter incorrect otp",
        duration: Duration(seconds: 2),
      ));
    }
  }

  // repeatCount() async {
  //   countdownController.autoStart;
  // }

  @override
  void onClose() {
    messegageOtpCode.refresh();
    textEditingController.dispose();
    SmsAutoFill().unregisterListener();
    super.onClose();
  }
}
