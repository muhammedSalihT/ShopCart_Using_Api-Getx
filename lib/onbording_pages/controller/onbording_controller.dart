import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import '../model/onbording_model.dart';

class OnBordingController extends GetxController {
  var selectedPage = 0.obs;
  var pageController = PageController();
  bool get isForward => selectedPage.value < 3;
  bool get isBackward => selectedPage.value > -1;

  forwardAction() {
    if (isForward) {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    } else {
      return;
    }
  }

  backwardAction() {
    if (isBackward) {
      pageController.previousPage(
          duration: 300.milliseconds, curve: Curves.ease);
    } else {
      return;
    }
  }

  List<OnBordingModel> onBordingPages = [
    OnBordingModel("assets/83548-online-shopping-black-friday.gif", "Shopping",
        "Experience the simplicity of online shopping"),
    OnBordingModel("assets/23730-3d-mobile-payment.gif", "Payment",
        "Feel free secuire payments and make it simple,paper free transactions"),
    OnBordingModel("assets/76930-add-to-cart.gif", "Easy to cart",
        "Shop randomly,just tab for your add to your cart")
  ];
}
