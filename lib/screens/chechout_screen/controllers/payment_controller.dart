import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/authentication_page/controllers/registration_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  final registrationController = Get.find<RegistrationController>();
  late Razorpay razorpay;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    razorpay = Razorpay();
    super.onInit();
  }

  Future<String?> loadUserNumber() async {
    String value = await storage.read(key: 'user.phoneNumber') ?? "";
    return value;
  }

  Future<String?> loadUserMail() async {
    String value = await storage.read(key: "user.email") ?? "";

    String a = value;
    log(a);
    return a;
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_KbbTTnSvV3BSs9',
      'amount': 100,
      'name': 'ShopCart',
      'description': 'Payment to shopcart',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': 3567587578,
        'email': await loadUserMail(),
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {}

  void handlePaymentError(PaymentFailureResponse response) {}

  void handleExternalWallet(ExternalWalletResponse response) {}
}
