import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ScrollController scrollController = ScrollController();
  late final Duration duration;
  RxBool isVisible = true.obs;

  bool isSearchVisibile = false;

  

  void onSearchButtonPress() {
    isSearchVisibile = true;
    update();
  }

  @override
  void onInit() {
    
    duration = const Duration(microseconds: 200);
    scrollController = ScrollController();
    scrollController.addListener(listen);
    super.onInit();
  }

  void listen() {
    final direction = scrollController.position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    isVisible.value = true;
    isSearchVisibile = false;
    update();
  }

  void hide() {
    isVisible.value = false;
    isSearchVisibile = false;
    update();
  }

  @override
  void dispose() {
    scrollController.removeListener(listen);
    super.dispose();
  }
}
