import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_shopcart/homepage/api/main_categorie_api.dart';
import 'package:project_shopcart/homepage/models/main_category_model.dart';
import 'package:project_shopcart/homepage/views/global_tab.dart';
import 'package:project_shopcart/homepage/views/tab_screen1.dart';
import 'package:project_shopcart/homepage/views/tab_screen2.dart';
import 'package:project_shopcart/homepage/views/tab_screen3.dart';
import 'package:project_shopcart/homepage/views/tab_screen4.dart';

class MainCategoryController extends GetxController {
  List<GetAllCategories> mainCategoryList = [];

  getMainCategorieData() async {
    log("maincate called");
    final responce = await MainCategorieApi().getAllMainCategories();
    if (responce != null) {
      mainCategoryList.clear();
      for (var element in responce.data!) {
        print('hihlo');
        mainCategoryList.add(element);
        log("$mainCategoryList");
      }
    }
    update();
  }

  @override
  void onInit() {
    log("called init getcate");
    getMainCategorieData();
    log("$mainCategoryList}");
    super.onInit();
  }

  Widget getScreen(
    String? screen,
  ) {
    switch (screen) {
      case "Shirts":
        return TabScreen1();
      case "Jeans":
        return const TabScreen2();
      case "Tracksuits":
        return const TabScreen3();
      case "Smart Watches":
        return const TabScreen4();
      default:
        return const GlobalTab();
    }
  }
}
