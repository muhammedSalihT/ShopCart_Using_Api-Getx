import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/homepage/controllers/main_category_controller.dart';
import 'package:project_shopcart/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/homepage/controllers/trending_product_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final mainCategoryController = Get.put(MainCategoryController());
  final subCategoryController = Get.put(SubCategorieController());
  final trendingController = Get.put(TrendingProductController());
  final budgetController = Get.put(BudgetProductController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          title: const Text("ShopCart"),
          actions: [
            IconButton(
              icon: const Icon(Icons.record_voice_over_outlined),
              onPressed: () {},
            )
          ],
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
                        subCategoryController.categorieId.value =
                            mainCategoryController.mainCategoryList[value].id
                                .toString();
                        log(subCategoryController.categorieId.value);
                      },
                    );
                  }),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 1.52,
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
                // SliverToBoxAdapter(
                //   child: Expanded(
                //     child: TabBarView(
                //         physics: const BouncingScrollPhysics(),
                //         children: mainCategoryController.mainCategoryList
                //             .map((e) => mainCategoryController
                //                 .getScreen(e.categoryName))
                //             .toList()),
                //   ),
                // )
              ],
            ),
          );
        }),
      ),
    );
  }
}
