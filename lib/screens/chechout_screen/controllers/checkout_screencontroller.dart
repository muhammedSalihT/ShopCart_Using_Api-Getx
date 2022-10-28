import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/chechout_screen/views/adress_screen.dart';
import 'package:project_shopcart/screens/chechout_screen/views/order_screen.dart';
import 'package:project_shopcart/screens/chechout_screen/views/payment_screen.dart';

class ChechOutScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: tabList.length);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List<Widget> tabList = [
    const Text(
      "Order",
      style: TextStyle(fontSize: 20),
    ),
    const Text(
      "Adress",
      style: TextStyle(fontSize: 20),
    ),
    const Text(
      "Payment",
      style: TextStyle(fontSize: 20),
    ),
  ];

  Widget getTabView(
    int? index,
  ) {
    switch (index) {
      case 0:
        return OrderScreen(
          index: index,
        );
      case 1:
        return  AdressScreen(index: index,);
      case 2:
        return const PaymentScreen();
      default:
        return const PaymentScreen();
    }
  }
}
