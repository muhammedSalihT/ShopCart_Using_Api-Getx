import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  @override
  void onClose() {
    messegageOtpCode.refresh();
    textEditingController.dispose();
    SmsAutoFill().unregisterListener();
    super.onClose();
  }
}
