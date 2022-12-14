import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/authentication_page/controllers/registration_controller.dart';
import 'package:project_shopcart/screens/authentication_page/controllers/verification_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerificationScreeen extends GetView<VerificationController> {
  VerificationScreeen({Key? key, required this.userId}) : super(key: key);

  @override
  final controller = Get.put(VerificationController());
  final regisController = Get.find<RegistrationController>();
  final String userId;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade200),
                child: Transform.rotate(
                  angle: 38,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image(
                      image: AssetImage("assets/email.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Please enter the 4 digit code sent to ${regisController.reigsterEmailControll.text}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.grey.shade500, height: 1.5),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: PinFieldAutoFill(
                  codeLength: 4,
                  textInputAction: TextInputAction.done,
                  decoration: UnderlineDecoration(
                      colorBuilder: const FixedColorBuilder(Colors.transparent),
                      bgColorBuilder:
                          FixedColorBuilder(Colors.grey.withOpacity(0.2))),
                  controller: controller.textEditingController,
                  currentCode: controller.messegageOtpCode.value,
                  onCodeSubmitted: (code) {},
                  onCodeChanged: (code) {
                    controller.messegageOtpCode.value = code!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Countdown(
                  controller: controller.countdownController,
                  seconds: 5,
                  interval: const Duration(milliseconds: 1000),
                  build: (context, currentRemainingTime) {
                    if (currentRemainingTime == 0.0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Did't recive OTP?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Request again",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text(
                        currentRemainingTime.toString().length == 4
                            ? "Time remaining : ${currentRemainingTime.toString().substring(0, 2)}"
                            : "Time remaining : ${currentRemainingTime.toString().substring(0, 1)}",
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomSheet: GestureDetector(
          onTap: () {
            controller.verifyUser(userId);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 14),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(color: Colors.blue, width: 1),
                color: Colors.blue),
            width: context.width,
            child: const Text(
              "Verify and Create Account",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ));
  }
}
