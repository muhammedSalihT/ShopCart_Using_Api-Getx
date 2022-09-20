import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_shopcart/homepage/models/main_category_model.dart';
import 'package:project_shopcart/homepage/views/global_tab.dart';
import 'package:project_shopcart/homepage/views/tab_screen1.dart';
import 'package:project_shopcart/homepage/views/tab_screen2.dart';
import 'package:project_shopcart/homepage/views/tab_screen3.dart';
import 'package:project_shopcart/homepage/views/tab_screen4.dart';

class MainCategoryController extends GetxController {
  List<MainCategoryModel> mainCategoryList = [
    MainCategoryModel(categoryName: "Shirts"),
    MainCategoryModel(categoryName: "Jeans"),
    MainCategoryModel(categoryName: "Tracksuits"),
    MainCategoryModel(categoryName: "Smart Watches"),
    MainCategoryModel(categoryName: "Shoes"),
    MainCategoryModel(categoryName: "Wallets"),
    MainCategoryModel(categoryName: "Wallets"),
  ];

  Widget getScreen(String screen) {
    switch (screen) {
      case "Shirts":
        return const TabScreen1();
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
