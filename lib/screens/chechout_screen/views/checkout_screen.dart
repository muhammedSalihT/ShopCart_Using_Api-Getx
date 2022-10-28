import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/chechout_screen/controllers/checkout_screenController.dart';

class CheckOutScreen extends GetView {
  CheckOutScreen({Key? key}) : super(key: key);

  final chechOutController = Get.put(ChechOutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Check out here"),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: DefaultTabController(
              length: 3,
              child: SizedBox(
                height: 30,
                child: IgnorePointer(
                  child: TabBar(
                    controller: chechOutController.tabController,
                    tabs: List.generate(
                      chechOutController.tabList.length,
                      (index) {
                        return chechOutController.tabList.elementAt(index);
                      },
                    ),
                  ),
                ),
              ),
            )),
      ),
      body: TabBarView(
          controller: chechOutController.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(chechOutController.tabList.length, (index) {
            return chechOutController.getTabView(index);
          })),
    );
  }
}
