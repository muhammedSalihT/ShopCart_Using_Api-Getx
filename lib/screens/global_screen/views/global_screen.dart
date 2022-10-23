import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/global_screen/controllers/global_controller.dart';
import 'package:project_shopcart/screens/global_screen/widgets/hiding_bottom_bar.dart';

class GlobalScrren extends StatelessWidget {
  GlobalScrren({Key? key}) : super(key: key);

  final globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return globalController.pages[globalController.selectedIndex.value];
          },
        ),
      ),
      bottomNavigationBar: HidingBottomBar(),
    );
  }
}
