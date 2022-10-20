import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_shopcart/homepage/controllers/main_category_controller.dart';
import 'package:project_shopcart/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/homepage/responsive/dimensions.dart';

class Responsive {
  static TabBar responsiveTabBar(MainCategoryController mainCategoryController,
      SubCategorieController subCategorieController) {
        if(mainCategoryController.mainCategoryList.isEmpty){
          return 
        }
    return TabBar(
      physics: const NeverScrollableScrollPhysics(),
      indicator: const BoxDecoration(color: Colors.white),
      labelColor: Colors.blue,
      isScrollable: true,
      tabs: mainCategoryController.mainCategoryList.map((e) {
        return Tab(
          text: e.mainProduct,
        );
      }).toList(),
      onTap: (value) {
        tappedCategorie.value = mainCategoryController
            .mainCategoryList[value].mainProduct
            .toString();
        log(tappedCategorie.value);
      },
    );
  }
}
