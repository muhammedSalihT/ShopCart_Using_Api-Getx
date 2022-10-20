import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/homepage/controllers/main_category_controller.dart';
import 'package:project_shopcart/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/homepage/controllers/trending_product_controller.dart';
import 'package:project_shopcart/homepage/responsive/dimensions.dart';
import 'package:project_shopcart/homepage/responsive/tabbar.dart';

class HomeScreen extends GetView {
  HomeScreen({Key? key}) : super(key: key);

  final mainCategoryController = Get.put(MainCategoryController());
  final subCategoryController = Get.put(SubCategorieController());
  final trendingController = Get.put(TrendingProductController());
  final budgetController = Get.put(BudgetProductController());

  @override
  Widget build(BuildContext context) {
    log("called Home");
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.record_voice_over_outlined),
                onPressed: () {},
              ),
              const Text("ShopCart"),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: GetBuilder<MainCategoryController>(
            builder: (mainCategoryController) {
          return DefaultTabController(
            length: mainCategoryController.mainCategoryList.length,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  titleSpacing: 5,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  toolbarHeight: 60,
                  floating: true,
                  flexibleSpace: const FlexibleSpaceBar(),
                  title: GetBuilder<MainCategoryController>(
                      builder: (mainCategoryController) {
                    return LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth < screenwidth) {
                        return Responsive.responsiveTabBar(
                            mainCategoryController, subCategoryController);
                      } else {
                        return Center(
                            child: Responsive.responsiveTabBar(
                                mainCategoryController, subCategoryController));
                      }
                    });
                  }),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 1.4,
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children:
                              mainCategoryController.mainCategoryList.map((e) {
                            return mainCategoryController
                                .getScreen(e.mainProduct);
                          }).toList()),
                    );
                  }, childCount: 1),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
