import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/api/main_categorie_api.dart';
import 'package:project_shopcart/screens/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/screens/homepage/models/main_category_model.dart';
import 'package:project_shopcart/screens/homepage/views/default_screen.dart';
import 'package:project_shopcart/screens/homepage/views/tab_screen1.dart';
import 'package:project_shopcart/screens/homepage/views/tab_screen2.dart';
import 'package:project_shopcart/screens/homepage/views/tab_screen3.dart';
import 'package:project_shopcart/screens/homepage/views/tab_screen4.dart';

class MainCategoryController extends GetxController {
  List<GetAllCategories> mainCategoryList = [];

  final subCategoryController = Get.put(SubCategorieController());

  

  getMainCategorieData() async {
    log("maincate called");
    final responce = await MainCategorieApi().getAllMainCategories();
    if (responce!.data!.isEmpty) {
      log("maincateEmpty");
      update();
    } else {
      mainCategoryList.clear();
      for (var element in responce.data!) {
        mainCategoryList.add(element);
        log("not empty main$mainCategoryList");
      }
      update();
    }
  }

  @override
  void onInit() {
    log("called init getcate");
    getMainCategorieData();
    log("$mainCategoryList}");
    super.onInit();
  }

  List<Widget> screenList = [
    TabScreen1(),
    TabScreen2(),
    const TabScreen3(),
    const TabScreen4()
  ];

  Widget getScreen(
    String? screen,
  ) {
    switch (screen) {
      case "TopWears":
        return TabScreen1();
      case "BottomWears":
        return TabScreen2();
      case "FootWears":
        return const TabScreen3();
      case "Watches":
        return const TabScreen4();
      default:
        return const Default();
    }
  }
}
