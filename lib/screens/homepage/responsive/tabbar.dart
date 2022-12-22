import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/controllers/main_category_controller.dart';
import 'package:project_shopcart/screens/homepage/responsive/dimensions.dart';
import 'package:shimmer/shimmer.dart';

final mainCategoryController = Get.find<MainCategoryController>();

class Responsive {
  static Widget responsiveTabBar() {
    if (mainCategoryController.mainCategoryList.isEmpty) {
      return LimitedBox(
        maxHeight: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                  baseColor: Colors.orange,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  ));
            }),
      );
    } else {
      return TabBar(
        physics: const NeverScrollableScrollPhysics(),
        indicator: BoxDecoration(border: Border.all(color: Colors.blue)),
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
        },
      );
    }
  }
}
